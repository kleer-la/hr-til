require 'rails_helper'

describe PostHelper do
  describe '#tweet_link' do
    it 'returns a link to twitter' do
      post = FactoryGirl.create(:post, slug: '1234')

      expected_result = "<a href=\"http://twitter.com/share\" class=\"twitter-share-button\" data-text=\"Today I learned: Web Development\" data-via=\"hashrocket\" data-hashtags=\"phantomjs\" data-url=\"http://www.example.com/posts/1234-web-development\">Tweet</a>"

      expect(helper.tweet_link(post)).to eq expected_result
    end

    it "returns a link to twitter with developer's twitter handle" do
      developer = FactoryGirl.create(:developer, twitter_handle: 'awesomehandle')
      post = FactoryGirl.create(:post, developer: developer, slug: '1234')

      expected_result = "<a href=\"http://twitter.com/share\" class=\"twitter-share-button\" data-text=\"Today I learned: Web Development\" data-via=\"awesomehandle\" data-hashtags=\"phantomjs\" data-url=\"http://www.example.com/posts/1234-web-development\">Tweet</a>"

      expect(helper.tweet_link(post)).to eq expected_result
    end

    context "with dashed channel name" do
      it "returns a link to twitter with a non-dashed hashtag" do
        developer = FactoryGirl.create(:developer, twitter_handle: 'awesomehandle')
        channel = FactoryGirl.create(:channel, name: 'dashy-channel')
        post = FactoryGirl.create(:post, developer: developer, channel: channel, slug: '1234')

        expected_result = "<a href=\"http://twitter.com/share\" class=\"twitter-share-button\" data-text=\"Today I learned: Web Development\" data-via=\"awesomehandle\" data-hashtags=\"dashychannel\" data-url=\"http://www.example.com/posts/1234-web-development\">Tweet</a>"

        expect(helper.tweet_link(post)).to eq expected_result
      end
    end
  end
end
