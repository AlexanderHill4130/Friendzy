module ApplicationHelper
  def user_chat_class(message)
    message.user == current_user ? 'user-message' : ''
  end
end
