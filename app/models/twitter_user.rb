class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!

  has_many :tweets

  validates :username, uniqueness: true

  def fetch_tweets!

    self.tweets.destroy_all
    @tweets = $client.user_timeline(self.username)

    @tweets.first(10).each do |t|
      Tweet.create(tweet_id: t.id, text: t.text, twitter_user: self)
    end
  end

  def stale?
    stale = Time.now - self.tweets.last.updated_at
    if stale > 3600
      true
    else
      false
    end
  end
end

