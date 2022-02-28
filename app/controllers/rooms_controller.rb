# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @new_room = Room.new
    @rooms = Room.order(created_at: :desc)
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @messages = MessageDecorator.decorate_collection(@room.messages.includes(:user))
    @new_message = current_user&.messages&.build(room: @room)
  end

  def create
    @new_room = Room.new(user: current_user)
    return unless @new_room.save

    @new_room.broadcast_prepend_to :rooms, partial: 'rooms/room',
                                           locals: { user: current_user, room: @new_room }
  end

  def favorites
    @rooms = Room.favorited_by(current_user&.email)
    @new_room = Room.new
  end
end
