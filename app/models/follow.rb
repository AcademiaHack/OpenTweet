class Follow < ActiveRecord::Base
  belongs_to :following, class_name: 'Twitter', foreign_key: :twitter_id
  belongs_to :followed, class_name: 'Twitter'

end
