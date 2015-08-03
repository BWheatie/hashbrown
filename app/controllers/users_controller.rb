class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    authenticate_user!
    @user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def update
    authenticate_user!
    user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    if user.update(user_params)
      render json: @user
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user
    current_user.follow(@user)
    RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :handle, :password)
  end
end
