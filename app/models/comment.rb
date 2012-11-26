class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true
end
