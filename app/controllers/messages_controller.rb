class MessagesController < ActionController::API
  def index
    @messages = Message.new
    render json: @messages
  end

  def show
    @message = Message.find (message_params)
    render json: @messages
  end

  def create
    @message = Message.new
    render json: @messages
  end

  def new
    @message = Message.new(message_params)
      @message.save
      redirect_to message_path(@message)
    render json: @messages
  end

  private
  def message
    @message = message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end