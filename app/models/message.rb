# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :likes, dependent: :destroy

  scope :sorted, -> { order(:id) }

  validates :body, presence: true
end
