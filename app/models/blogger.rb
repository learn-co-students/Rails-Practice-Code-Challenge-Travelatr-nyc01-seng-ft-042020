class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts


    def total_likes
    total = 0
    self.posts.each do |post|
       total += post.likes 
    end 
    total
    end

    def most_liked_post
    # arr = self.posts.select do |post|
    # post.likes
    # end
    # arr.max
    # ans = Post.find_by(likes:arr.max)
    # ans.name

    arr = self.posts.map do |post|
        post.likes
        end
        
        max = arr.max
        ans = Post.find_by(likes:max)
        ans.title

    end 


end
