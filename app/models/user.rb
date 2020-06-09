class User < ApplicationRecord
    has_secure_password 

    validates_presence_of :email 
    validates_uniqueness_of :email

    has_many :tweets, dependent: :destroy

    has_many :active_relationships, class_name: 'Relationship', foreign_key: :follower_id
    has_many :followees, class_name: 'User', through: :active_relationships
  
    has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followee_id
    has_many :followers, class_name: 'User', through: :passive_relationships
  
    def follow(user)
        followees << user if !self.following?(user) && self != user
    end

    def following?(user)
        followees.include?(user)
    end

    def unfollow(user)
        followees.delete(user)
    end

    def feed
        following_ids = "SELECT followee_id from relationships
                         WHERE follower_id = :user_id"
                         
        Tweet.where("user_id in (#{following_ids})
                     OR user_id = :user_id", user_id: id)
    end 
end
