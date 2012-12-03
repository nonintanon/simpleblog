class Photo < ActiveRecord::Base
  attr_accessible :caption, :file, :user_id, :processing
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :subscriptions, as: :subscribable
  has_many :subscribers, through: :subscriptions, source: :user

  scope :order_by_subscriptions_count, -> { order('subscriptions_count DESC') }
  mount_uploader :file, ImageUploader
end
