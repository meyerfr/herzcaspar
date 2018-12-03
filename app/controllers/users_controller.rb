class UsersController < ApplicationController
  def my_profile
    @user = current_user
    @users = User.all
    @conversations = Conversation.all
    set_messages
  end

  private

  def set_messages
    if !@conversation.nil?
      @conversation = Conversation.find_by(id: params[:conversation_id]) || Conversation.first
      @messages = @conversation.messages
      if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
      end
      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end
      if @messages.last
        @messages.last.read = true if @messages.last.user_id != current_user.id
      end
      @message = @conversation.messages.new
    end
    @data = []
    @events = Event.all
    @events.each do |e|
      @data << { title: e.title, start: e.start, end: e.end, description: e.description, location: e.location }
    end
  end
end
