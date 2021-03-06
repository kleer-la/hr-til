require 'rails_helper'

describe SocialMessaging::TwitterStatus do
  let(:developer) { FactoryGirl.create(:developer, username: 'cool developer', twitter_handle: 'handle') }
  let(:channel) { FactoryGirl.create(:channel, name: 'dreamwave') }

  let(:post) do
    FactoryGirl.build(:post,
     title: 'Cool post',
     slug: '1234',
     developer: developer,
     channel: channel
    )
  end

  let(:twitter_status) { described_class.new(post) }

  describe '#status' do
    it 'returns a Twitter status' do
      expected = "Cool post - from @handle http://www.example.com/posts/1234-cool-post #til #dreamwave"
      actual = twitter_status.send(:status)

      expect(actual).to eq expected
    end
  end
end
