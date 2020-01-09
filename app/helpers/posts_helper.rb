# frozen_string_literal: true

module PostsHelper
  def post_list(posts)
    content_tag :div do
      posts.collect do |post|
        concat((link_to  "#{post.created_at}", post_path(post)) +
          render('posts/post', post: post)  + content_tag(:hr))
      end
    end
  end
end
