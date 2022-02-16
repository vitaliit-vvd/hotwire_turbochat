# frozen_string_literal: true

class MessageDecorator < ApplicationDecorator
  delegate_all

  def heart(user)
    object.likes.find_by(user: user).present? ? '❤️' : '🤍'
  end

  def likes_count
    object.likes_count if object.likes_count.positive?
  end
end
