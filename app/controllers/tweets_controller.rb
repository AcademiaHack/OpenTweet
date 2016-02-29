class TweetsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  before_action :find_user
  before_action :find_tweet, only: [:show, :destroy]


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

  def show

  end

  def destroy
    if @current_twitter.id == @tweet.twitter.id
      @tweet.destroy
    else
      @messages = {error: 'CantNotDelete'}
      render status: :conflict, template: 'errors/show'
    end
  end

  private

  def twit_params
    params.permit(:text)
  end

  def find_tweet
    @tweet = Tweet.find params[:id]
  end

  def record_not_found
    @messages = {error: 'TweetNotFound'}
    render status: :conflict, template: 'errors/show'
  end

end