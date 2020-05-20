class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        Post.all.where(destination: self).order(:created_at).first(5)
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

    def average_age
        total = self.bloggers.uniq.map {|blogger| blogger.age}.sum
        blogger_count = self.bloggers.uniq.count
        if blogger_count == 0
            0
        else
            average = total/blogger_count
        end
    end
end
