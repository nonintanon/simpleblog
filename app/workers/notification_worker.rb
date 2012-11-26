class NotificationWorker
  include Sidekiq::Worker

  def perform(options = {})
    comment = Comment.find(options["comment_id"])
    commentable = comment.commentable
    subscribers = commentable.subscribers.where("user_id != ?", comment.user.id)
    subscribers.each do |subscriber|
      NotificationsMailer.comment_notification(subscriber, comment).deliver
    end
    commentable.update_attributes(processing: false)
  end
end