class Api::TagsController < ApplicationController
    def index
      @tags = Tag.all
    end
  
    def show
      tag = "#" + params[:id]
      @tag = Tag.find_by(name: tag)
      @tweets = @tag.tweets.all
      render 'api/tweets/index'
    end
    
  end
  