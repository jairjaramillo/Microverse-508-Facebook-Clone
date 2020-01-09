# frozen_string_literal: true

require 'rails_helper'

def create_post
  visit new_post_path
  fill_in 'Content', with: 'This is a test post with the minimum length.'
  click_button 'submit post'
end
