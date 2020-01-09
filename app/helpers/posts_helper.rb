# frozen_string_literal: true

module PostsHelper
  def post_list(posts)
    content_tag :div do
      posts.collect do |post|
        concat((link_to post.created_at.strftime('%d/%m/%Y %Hh:%M').to_s, post_path(post)) +
        render('posts/post', post: post, show_likes: false) + content_tag(:hr))
      end
    end
  end

  def likes_list(likes)
    content_tag :div, id: 'likers' do
      likes.collect do |like|
        concat(render('users/likes', user: "#{like.user.first_name} #{like.user.last_name}"))
      end
    end
  end

  def who_likes(show_likes, list)
    if show_likes
      content_tag(:h2, 'People who liked this:') +
        likes_list(list)
    else
      ''
    end
  end
end
