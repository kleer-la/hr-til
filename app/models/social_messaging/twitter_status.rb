module SocialMessaging
  class TwitterStatus
    attr_reader :post

    def initialize(post)
      @post = post
    end

    def post_to_twitter
      return if post.draft? || post.tweeted
      if ENV['HA_UPDATE_TWITTER_WITH_POST'] == 'true'
        TwitterClient.update(status)
        post.tweeted = true
        post.save
      end
    end

    private

    def title
      post.title
    end

    def name
      post.twitter_handle
    end

    def category
      post.channel_name.delete('-')
    end

    def host
      ENV.fetch('HA_HOST')
    end

    def status
      "#{title} - from @#{name} #{Rails.application.routes.url_helpers.post_url(titled_slug: post.to_param, host: host)} #ha ##{category}"
    end
  end
end
