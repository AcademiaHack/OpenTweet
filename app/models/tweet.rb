class Tweet < ActiveRecord::Base
  validates_presence_of :text

  belongs_to :twitter

end
