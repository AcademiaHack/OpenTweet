class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, presence: true

  belongs_to :userable, polymorphic: true

  belongs_to :twitter
end
