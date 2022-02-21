# frozen_string_literal: true

module ApplicationHelper
  def user_nav_name(user)
    content_tag(:span, user.username,
                class: 'font-bold').concat content_tag(:span, ' Logout', class: %w[font-light italic])
  end
end
