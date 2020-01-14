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
    @friends_and_me = current_user.friends(current_user) << current_user
    @posts = friends_posts(@friends_and_me)
    @post = Post.new
  end

  def friends_posts(friends)
    posts = []
    friends.each do |friend|
      posts += friend.posts
    end
    posts = posts.sort do |x, y|
      y.created_at <=> x.created_at
    end
    posts
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
