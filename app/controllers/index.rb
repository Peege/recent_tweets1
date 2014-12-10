get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/username' do
  redirect "/#{params[:username]}"
end

get '/:username' do

  @user = TwitterUser.find_or_create_by_username(username: params[:username])

  if @user.tweets.empty? || @user.stale?
    @user.fetch_tweets!

  end

  @tweets = @user.tweets

  erb :showtwitter
end
