class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates :body, :title, presence: true

  has_many :comments, as: :commentable
  has_many :subscriptions, as: :subscribable
  has_many :subscribers, through: :subscriptions, source: :user
end
