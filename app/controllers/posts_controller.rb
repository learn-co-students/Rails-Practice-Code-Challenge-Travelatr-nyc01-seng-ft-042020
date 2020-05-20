class PostsController < ApplicationController
  
  before_action :find_post, only: [:edit, :update, :show, :addlike]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
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

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    @post.update(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:my_errors] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def show
  end

  def addlike
    likes = @post.likes
    likes += 1
    @post.update(likes: likes)
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger, :destination)
  end
end
