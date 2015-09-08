get '/' do
  erb :welcome
end

get '/recent_tweets' do
  @user = User.find_or_create_by(twitter_handle: params[:twitter_handle])
  @recent_tweets = @user.tweets
  erb :user_tweets
end

get '/recent_tweets/:twitter_handle' do
	@user = User.find_by(twitter_handle: params[:twitter_handle])
	if @user.tweets_stale?
	  @user.tweets.each {|tweet| tweet.destroy}
	  @recent_tweets = @user.recent_tweets
	  erb :user_tweets
    else
	  @recent_tweets = @user.tweets
	  erb :user_tweets
  end
end