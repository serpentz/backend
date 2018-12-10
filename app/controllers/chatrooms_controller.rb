class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :update, :destroy]

  # GET /chatrooms
  def index
    @chatrooms = Chatroom.all

    render json: @chatrooms
  end

  # GET /chatrooms/1
  def show
    render json: @chatroom
  end

  # POST /chatrooms
  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChatroomSerializer.new(@chatroom)
      ).serializable_hash

      ActionCable.server.broadcast 'chatrooms_channel', serialized_data
      #render json: @chatroom, status: :created, location: @chatroom
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chatrooms/1
  def update
    if @chatroom.update(chatroom_params)
      render json: @chatroom
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chatrooms/1
  def destroy
    @chatroom.destroy
  end

  # POST /chatrooms/:id
  def join
    @chatroom_user = ChatroomUser.create(user_id:params[:user_id],chatroom_id:params[:chatroom_id])
    if(@chatroom_user.save)
      render json: @chatroom_user, status: :created, success: true
    else
      render json: @chatroom_user.errors, status: :unprocessable_entity, success: false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

     def join_params
      params.permit(:user_id,:chatroom_id)
     end 

    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end
