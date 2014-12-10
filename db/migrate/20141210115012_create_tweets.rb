class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :tweet_id, :limit => 8
      t.text :text
      t.belongs_to :twitter_user

      t.timestamps
    end
  end
end
