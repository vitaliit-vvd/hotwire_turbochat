# frozen_string_literal: false

module LikesHelper
  def likes(message, user)
    heart =
      if message.likes.find_by(user: user).present?
        '❤️'
      else
        '🤍'
      end

    heart << " #{message.likes_count}" if message.likes_count.positive?

    heart
  end
end
