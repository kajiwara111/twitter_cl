class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new
    end         

    def create  
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice:"tweetを投稿しました"
        else
            flash.now[:alert] = 'tweetは１文字以上１４０文字以内で投稿してください'
            render new_tweet_path
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def destroy

    end

    def confirm
        @tweet = Tweet.new(tweet_params)
    end

    private

    def tweet_params
        params.require(:tweet).permit(:content)
    end


end
