class Blogger < ApplicationRecord
    has_many :posts
    has_many :desinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.map do |post|
            post.likes
        end.sum
    end

    def most_likes
        self.posts.max {|a, b| a.likes <=> b.likes}.title
    end

end
