class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true

  after_create :notify_subscribers

  def notify_subscribers
    subscribers = commentable.subscribers.where("user_id != ?", user.id)
    subscribers.each do |subscriber|
      NotificationsMailer.comment_notification(subscriber, self).deliver
    end
  end
end
