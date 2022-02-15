# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @new_message = current_user.messages.build(strong_params)

    @new_message.broadcast_append_to @new_message.room, locals: { user: current_user } if @new_message.save
  end

  private

  def strong_params
    params.require(:message).permit(:body, :room_id)
  end
end
