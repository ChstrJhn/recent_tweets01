class User < ActiveRecord::Base
  has_many :tweets

  def recent_tweets
  	@user_feed = $twitter.user_timeline(self.twitter_handle)
  	@recent_tweets = @user_feed.take(10)
  	@recent_tweets.each do |tweet|
  		Tweet.create(user_id: @user.id, text: tweet.text)
  	end
  end
end
