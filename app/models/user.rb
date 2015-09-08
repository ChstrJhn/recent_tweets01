class User < ActiveRecord::Base
  has_many :tweets

  def recent_tweets
  	@user_feed = $twitter.user_timeline(self.twitter_handle)
  	@recent_tweets = @user_feed.take(10)
  	@recent_tweets.each do |tweet|
  		Tweet.find_or_create_by(user_id: self.id, text: tweet.text)
  	end
  end
end
