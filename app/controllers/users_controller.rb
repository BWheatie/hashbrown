class UsersController < ActionController::Base

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def update
    @user = User.update(user_params)
    if @user.save
      flash[:notice] = "Your profile has been updated"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Your account has been deleted"
    redirect_to user_path
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :handle)
  end
end