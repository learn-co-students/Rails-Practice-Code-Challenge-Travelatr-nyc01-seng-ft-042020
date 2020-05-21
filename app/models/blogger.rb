class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }


    def total_likes
        self.posts.map {|post| post.likes}.sum
    end

    def most_likes
        self.posts.max {|a, b| a.likes <=> b.likes}
    end
end
