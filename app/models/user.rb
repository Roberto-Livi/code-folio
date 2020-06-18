class User < ActiveRecord::Base
    has_many :posts
    has_many :comments, through: :posts
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: { in: 5..30 }

    has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy

    has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

    has_many :following, through: :active_follows, source: :followed

    has_many :followers, through: :passive_follows, source: :follower

    def follow(user)
        active_follows.create(followed_id: user.id)
    end

    def unfollow(user)
        active_follows.find_by(followed_id: user.id).destroy
    end

    def following?(user)
        following.include?(user)
    end

    def self.search(search)
        if search
            @user = User.find_by(:username => search)
            if @user
                @user
            else
                @users = User.all
            end
        else
            @posts = Post.all
        end
    end

end