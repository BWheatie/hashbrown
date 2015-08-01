class PagesController < ActionController::Base

  def index
    @user = User.new
  end

  def users
    @user = Users.all
  end
end