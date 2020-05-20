class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :like, :destroy]

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)

        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:my_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def like
        @post.update(likes: @post.likes+=1)
        redirect_to post_path(@post)
    end

    def destroy
        @post.destroy
        redirect_to post_path(@post.id + 1)
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
