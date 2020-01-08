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
    @author = current_user
    @post = @author.posts.build(post_params)
    # @post = Post.new(content: 'This is a very very valid comment omg', author_id: 10)

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash[:error] = 'Error saving new post :-('
      redirect_to posts_path
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
      redirect_to posts_path
    else
      flash.now[:error] = 'Error deleting post :-('
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.all_latest
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
