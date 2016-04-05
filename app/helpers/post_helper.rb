module PostHelper
  def multiple_posts?
    Post.count > 1
  end

  def newest_post?(post)
    post == Post.published_and_ordered.first
  end

  def oldest_post?(post)
    post == Post.published_and_ordered.last
  end

  def previous_post(post)
    posts = Post.published_and_ordered
    posts[posts.index(post) + 1]
  end

  def next_post(post)
    posts = Post.published_and_ordered
    posts[posts.index(post) - 1]
  end

  def tweet_link(post)
    title = post.title
    handle = post.twitter_handle
    channel = post.channel_name.delete('-')

    url = Rails.configuration.server_url + post_path(post)

    content_tag(:a,
      'Tweet',
      href: 'http://twitter.com/share',
      class: 'twitter-share-button',
      'data-text': "#HA: Hoy Aprendí: #{title}",
      'data-via': "#{handle}",
      'data-hashtags': "#{channel}",
      'data-url': "#{url}"
    )
  end
end
