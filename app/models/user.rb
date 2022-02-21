# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, -> { sorted }, dependent: :destroy

  def username
    # "john.doe@example.com" -> "John Doe"
    email.split('@').first.parameterize.split('-').join(' ').titlecase
  end
end
