module CommentsHelper
  def comment_list(comments)
    content_tag :div do
      comments.collect do |comment|
        concat(render('comments/comment', comment: comment))
      end
    end
  end

  def delete_comment(comment)
    if comment.commenter == current_user
      link_to 'delete', comment_path(comment), method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
