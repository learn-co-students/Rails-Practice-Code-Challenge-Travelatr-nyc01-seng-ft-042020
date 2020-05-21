class PostsController < ApplicationController


    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_past(@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def show
        @post = Post.find(params[:id])
    end


    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
