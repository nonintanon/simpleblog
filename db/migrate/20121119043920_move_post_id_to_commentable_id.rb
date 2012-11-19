class MovePostIdToCommentableId < ActiveRecord::Migration
  def change
    Comment.all.each do |comment|
      comment.commentable = comment.post
      comment.save
    end
  end
end
