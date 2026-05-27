class MessagesController < ApplicationController
  def create
    # 1. Find the chat with params[:chat_id]
    @chat = Chat.find(params[:chat_id])
    # 2. Create the message with strong params
    @message = Message.new(message_params)
    # 3. Attach the chat to the message
    @message.chat = @chat
    # 4. Set as is_assistant : false (because the user created this)
    @message.role = "user"
    # 5. Save the message
    if @message.save
      # redirect_to chat_path(@chat)
      # Generate AI response
      generate_ai_response
      # 5a. Generate the AI response if successful
      respond_to do |format|
        # format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
        format.html { redirect_to chat_path(@chat) }
      end
    else
      # 5b. Render the chat show page again it fails
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def generate_ai_response
    @ruby_llm = RubyLLM.chat
    build_chat_history
    response = @ruby_llm
               .with_instructions("Test.")
               .ask(@message.content)
    @assistant_message = Message.create(
      role: "assistant",
      chat: @chat,
      content: response.content
    )
  end

  def build_chat_history
    @chat.messages.each do |msg|
      @ruby_llm.add_message(
        role: msg.role,
        content: msg.content
      )
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
