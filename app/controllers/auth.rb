get '/' do
  erb :welcome
end

get '/:twitter_handle' do
  @user = User.find_or_create_by(twitter_handle: params[:twitter_handle])
  @recent_tweets = @user.recent_tweets
  erb :user_tweets
end