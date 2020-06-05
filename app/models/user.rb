class User < ApplicationRecord
    has_secure_password 

    validates_presence_of :email 
    validates_uniqueness_of :email

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

end
