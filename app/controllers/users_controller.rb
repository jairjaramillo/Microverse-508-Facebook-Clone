class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
