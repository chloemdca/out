class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  # GET /chats/1 or /chats/1.json
  def show
    @chat = Chat.find(params.expect(:id))
    @chats = Chat.all
    @message = Message.new
  end
end
