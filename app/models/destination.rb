class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts


    def last_five
        self.posts.last(5)
    end

    def avg_age
        total = self.bloggers.uniq.map {|x| x.age}.sum
        avg = total/self.bloggers.count
        avg.to_f
    end
end
