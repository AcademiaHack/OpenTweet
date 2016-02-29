class Follow < ActiveRecord::Base
  validates :following_id, uniqueness: {scope: :followed_id}

  belongs_to :following, class_name: 'Twitter', foreign_key: 'following_id'
  belongs_to :followed, class_name: 'Twitter'

end
