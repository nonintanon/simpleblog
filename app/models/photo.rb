class Photo < ActiveRecord::Base
  attr_accessible :caption, :file, :user_id, :processing
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :subscriptions, as: :subscribable
  has_many :subscribers, through: :subscriptions, source: :user

  mount_uploader :file, ImageUploader
end
