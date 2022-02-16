# frozen_string_literal: false

module LikesHelper
  def heart(message, user)
    message.likes.find_by(user: user).present? ? '❤️' : '🤍'
  end

  def likes_count(message)
    message.likes_count if message.likes_count.positive?
  end
end
