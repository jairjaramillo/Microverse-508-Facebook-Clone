# frozen_string_literal: true

module CommentsHelper
  def delete_comment(comment)
    return if comment.commenter != current_user

    link_to 'delete', comment_path(comment), method: :delete, data: { confirm: 'Are you sure?' }
  end
end
