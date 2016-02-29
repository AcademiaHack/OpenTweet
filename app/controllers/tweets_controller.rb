class TweetsController < ApplicationController

  before_action :find_user

  def create
    @tweet = Tweet.new twit_params
    @tweet.twitter = @current_twitter
    puts @current_twitter.id
    unless @tweet.save
      @messages = @tweet.errors.messages
      render status: :conflict, template: 'errors/show'
    end
  end

  def index
    @tweets = @current_twitter.tweets

    @current_twitter.followings.includes(:tweets).each do |twitter|
      @tweets += twitter.tweets
    end

  end

  def twit_params
    params.permit(:text)
  end

end