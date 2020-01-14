# frozen_string_literal: true

require 'rails_helper'

def create_comment(comment_text)
  fill_in 'Content', with: comment_text
  click_button 'send comment'
end
