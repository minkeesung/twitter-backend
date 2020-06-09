class CreateTweetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_tags do |t|
      t.references :tweet
      t.references :tag

      t.timestamps
    end
  end
end
