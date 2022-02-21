# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, -> { sorted }, dependent: :destroy

  before_create { self.title = SecureRandom.hex(3) }

  kredis_unique_list :room_online_user_ids

  # Set online status for Room instance
  def add_room_online_user(user_id)
    room_online_user_ids << user_id
  end

  def remove_room_online_user(user_id)
    room_online_user_ids.remove(user_id)
  end

  def online_room_users_count
    room_online_user_ids.elements.count
  end

  def room_online_users
    User.where(id: room_online_user_ids.elements)
  end

  def room_user_online?(id)
    id.to_s.in?(room_online_user_ids.elements)
  end
end
