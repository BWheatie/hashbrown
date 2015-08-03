class PagesController < ActionController::API
  def home
    render text: "Welcome to Hashbrown!"
  end
end
