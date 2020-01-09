# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.author
    @comment = Comment.new
  end

  def create
    @author = current_user
    @post = @author.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      error_str = error_messages('Error saving new post: ', @post.errors.full_messages)
      flash[:error] = error_str
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(post_params)
  end

  def update; end

  def destroy
    @post = Post.find(params[:id])
    if @post&.destroy
      flash[:success] = 'Post successfully deleted'
    else
      flash.now[:error] = 'Error deleting post :-('
    end
    redirect_to posts_path
  end

  def index
    @posts = Post.all_latest
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def error_messages(str, array)
    final_str = str
    array.each do |err|
      final_str += err
    end
    final_str
  end
end
