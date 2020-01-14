# frozen_string_literal: true

require 'rails_helper'

def create_post(text = nil)
  content = text.nil? ? 'This is a test post with the minimum length.' : text
  visit new_post_path
  fill_in 'Content', with: content
  click_button 'submit post'
end
