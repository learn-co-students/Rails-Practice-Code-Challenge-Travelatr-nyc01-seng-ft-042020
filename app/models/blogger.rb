class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def likes
        likes = []
        self.posts.each do |post|
            likes << post.likes
        end

        likes
    end

    def total_likes
        likes.sum
    end

    def featured_post
        likes.max
        self.posts.find_by(likes: likes.max)
    end

    def top_five_destinations
        all_destinations = []
        post_counts = []
        top_five = []

        self.destinations.each {|destination| all_destinations << destination}

        self.destinations.each do |destination|
            post_counts << destination.posts.count
        end

        5.times do
            if post_counts.length > 0 

            max = post_counts.max

            @destination = self.destinations.find {|destination| destination.posts.count == max}
    
            post_counts.delete(max)
            all_destinations.delete(@destination)

            top_five << @destination
            end
        end

        top_five
    end

end
