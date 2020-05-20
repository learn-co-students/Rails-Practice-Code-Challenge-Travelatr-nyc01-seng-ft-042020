class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        likes = self.posts.map {|post| post.likes}
        self.posts.find_by(likes: likes.max)
    end

    def average_age
        ages = []

        self.bloggers.each do |blogger|
            ages << blogger.age
        end

        if ages.length > 0 
            ages.sum / ages.length
        end
    end

end
