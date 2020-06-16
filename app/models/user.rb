class User < ActiveRecord::Base
    has_many :posts
    has_many :comments, through: :posts
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: { in: 5..30 }

    def self.search(search)
        if search
            @user = User.find_by(:username => search)
            if @user
                @user
            else
                @users = User.all
            end
        else
            @users = User.all
        end
    end

end