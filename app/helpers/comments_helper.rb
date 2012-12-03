module CommentsHelper
  def comment_action_for comment
    if comment.user == current_user
      render 'comments/actions', comment: comment
    end
  end

  def render_comment_form_for commentable
    render 'comments/form', comment: commentable.comments.build, commentable: commentable if current_user
  end
end