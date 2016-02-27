class TwitsController < ApplicationController

  before_action :find_user

  def create
    @twit = Twit.new twit_params
    @twit.twitter = @current_twitter
    unless @twit.save
      @messages = @twit.errors.messages
      render status: :conflict, template: 'errors/show'
    end
  end

  def index
    @twits = @current_twitter.twits

    #@current_twitter.followings do |twitter|
    #  puts twitter.id
    #  @twits << twitter.twits
    #end

  end

  def twit_params
    params.permit(:text)
  end

end