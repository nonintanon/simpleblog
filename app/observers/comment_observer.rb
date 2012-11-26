class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    unless comment.commentable.processing?
      comment.commentable.update_attributes(processing: true)
      NotificationWorker.perform_async({comment_id: comment.id}) 
    end
  end
end