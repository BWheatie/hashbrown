class MessagesController < ActionController::API
  def index
    if params[:user_id]
      @messages = Message.where(user_id: params[:user_id])
    else
      @messages = Message.all
    end
    render json: @messages
  end

  def show
    @message = Message.find(params[:id])
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
