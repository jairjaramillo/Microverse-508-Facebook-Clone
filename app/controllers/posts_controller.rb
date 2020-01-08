class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.author
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash.now[:error] = 'Error saving new post :-('
      redirect_to @post
    end
  end

  def edit
    @post = Post.find(post_params)
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    if @post&.destroy
      flash[:success] = 'Post successfully deleted'
      redirect_to post_path
    else
      flash[:error] = 'Error deleting post :-('
      redirect_to post_path
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
