class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }
    
    def total_likes
        self.posts.map {|post| post.likes}.sum
    end

    def featured_post
        featured_post = self.posts.first
        self.posts.each do |post|
            if post.likes > featured_post.likes
                featured_post = post
            else
                featured_post
            end
        end
        featured_post
    end
end
