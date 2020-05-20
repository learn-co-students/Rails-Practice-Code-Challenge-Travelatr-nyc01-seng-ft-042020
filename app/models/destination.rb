class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        posts = self.posts.all.order('created_at DESC').take(5)
        posts.map do |post|
            post.title
        end
    end

    def featured_post
        self.posts.max {|a, b|a.likes<=>b.likes}.title 
    end

    def average_age
        total_age = self.bloggers.uniq.map do |blogger|
            blogger.age
        end.sum
        total_bloggers = self.bloggers.uniq.count
        (total_age/total_bloggers).to_f
    end

end
