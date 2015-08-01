class UsersController < ActionController::Base


  def index
    authenticate_user!
    @users = User.all
    render_json_api users
  end

  def show
    authenticate_user!
    @user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    render_json_api users
  end

  def new
    @user = User.new
    render_json_api users
  end

  def create
    @user = User.new(user_params)
    render_json_api users
  end

  def update
    authenticate_user!
    user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    user.update(user_params)
    render_json_api user
  end

  def destroy
    @user.destroy
    flash[:notice] = "Your account has been deleted"
    redirect_to user_path
    render_json_api users
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :handle)
  end
end