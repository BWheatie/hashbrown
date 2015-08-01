class MessagesController < ActionController::Base
  def index
    @messages = Messages.new
  end

  def show
    @message = Message.find (message_params)
  end

  def create
    @message = Message.new
  end

  def new
    @message = Message.new(message_params)
    if @message.save
      flash [:notice] = "You hash has been posted"
      redirect_to message_path(@message)
  end

  private
  def message
    @message = message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end