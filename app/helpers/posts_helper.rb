# frozen_string_literal: true

module PostsHelper
  def post_list(posts)
    content_tag :div do
      posts.collect do |post|
        concat(render('posts/post', post: post))
      end
    end
  end
end
