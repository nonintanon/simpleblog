class NotificationWorker
  include Sidekiq::Worker

  def perform(options = {})
    comment = Comment.find(options["comment_id"])
    commentable = comment.commentable
    subscribers = commentable.subscribers.where("user_id != ?", comment.user.id)
    subscribers.each do |subscriber|
      NotificationsMailer.delay.comment_notification(subscriber, comment)
    end
    commentable.update_attributes(processing: false)
  end
end