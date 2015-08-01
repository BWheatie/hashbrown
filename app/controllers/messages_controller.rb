class MessagesController < ActionController::Base
  def index
    @messages = Message.new
    render_json_api messages
  end

  def show
    @message = Message.find (message_params)
    render_json_api users
  end

  def create
    @message = Message.new
    render_json_api users
  end

  def new
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "You hash has been posted"
      redirect_to message_path(@message)
    end
    render_json_api users
  end

  private
  def message
    @message = message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end