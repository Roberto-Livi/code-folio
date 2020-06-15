class User < ActiveRecord::Base
    has_many :posts
    has_many :comments, through: :posts
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: { in: 5..30 }
end