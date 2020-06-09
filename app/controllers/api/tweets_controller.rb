class Api::TweetsController < ApplicationController
    def index 
        @tweets = current_user.feed
        render 'api/tweets/index'
    end 

    def create
        # Add tweet to current user
        @tweet = current_user.tweets.new(tweet_params)
        @tweet.save

        # Extracting Hashtags
        @tag_array = @tweet.body.scan(/#\w+\b/)
    
        # Running a loop that adds each hashtag association to the PostTag table
   
        unless @tag_array == []
            @tag_array.each do |tag|
                @tag = Tag.find_or_initialize_by(name: tag)
                @tag.save 

                @tweet.tags << @tag
            end
        end

        render 'api/tweets/show'
      end
    
    def destroy 
        Tweet.destroy(params[:id])
        
            render json: {id: params[:id]}
    end


    private 

    def tweet_params
        params.require(:tweet).permit(:body)
    end
end