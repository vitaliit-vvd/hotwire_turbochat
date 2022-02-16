# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @new_message = current_user.messages.build(strong_params)

    return unless @new_message.save

    room = @new_message.room
    @new_message.broadcast_append_to room, target: "room_#{room.id}_messages", locals: { user: current_user }
  end

  def like
    like = message.likes.find_by(user: current_user)
    like.present? ? like.destroy : @message.likes.create(user: current_user)
    replace_hear_like
    replace_count_likes
  end

  private

  def strong_params
    params.require(:message).permit(:body, :room_id)
  end

  def message
    @message ||= Message.find(params[:id])
  end

  def room
    @room ||= message.room
  end

  def replace_hear_like
    @message.broadcast_replace_to [current_user, room], target: "message_like_#{@message.id}",
                                                        partial: 'messages/heart',
                                                        locals: { user: current_user, message: @message }
  end

  def replace_count_likes
    @message.broadcast_replace_to room, target: "message_likes_count_#{@message.id}",
                                        partial: 'messages/likes_count',
                                        locals: { user: current_user, message: @message }
  end
end
