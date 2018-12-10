class ChatroomUsersController < ApplicationController
  before_action :set_chatroom_user, only: [:show, :update, :destroy]

  # GET /chatroom_users
  def index
    @chatroom_users = ChatroomUser.all

    render json: @chatroom_users
  end

  # GET /chatroom_users/1
  def show
    render json: @chatroom_user
  end

  # POST /chatroom_users
  def create
    @chatroom_user = ChatroomUser.new(chatroom_user_params)

    if @chatroom_user.save
      render json: @chatroom_user, status: :created, location: @chatroom_user
    else
      render json: @chatroom_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chatroom_users/1
  def update
    if @chatroom_user.update(chatroom_user_params)
      render json: @chatroom_user
    else
      render json: @chatroom_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chatroom_users/1
  def destroy
    @chatroom_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom_user
      @chatroom_user = ChatroomUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chatroom_user_params
      params.fetch(:chatroom_user, {})
    end
end
