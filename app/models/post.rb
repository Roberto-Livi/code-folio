class Post < ActiveRecord::Base
    has_many :comments
    has_many :users, through: :comments
    scope :longest_post, -> {order('LENGTH(content) desc').limit(1)}
end