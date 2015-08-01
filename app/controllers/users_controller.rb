class UsersController < ActionController::API

  def index
    render json: @users
  end

  def show
    authenticate_user!
    @user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      render json: @user
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    authenticate_user!
    user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
    redirect_to user_path
    render json: @users
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
  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :handle)
  end
end