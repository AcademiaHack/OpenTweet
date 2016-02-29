class Twitter < ActiveRecord::Base
  validates :username, uniqueness: true

  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user

  has_many :follows, foreign_key: 'followed_id'
  has_many :followings, through: :follows

  has_many :reverse_follows, foreign_key: 'following_id', class_name: 'Follow'
  has_many :followers, through: :reverse_follows, source: :followed

  has_many :tweets


end
