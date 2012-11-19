class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_scope
  respond_to :js, :html, :json

  def new
    @comment = @commentable.comments.build
  end

  def edit
    @comment = get_comment
    if @comment.user == current_user
      respond_with @comment
    end
  end

  def update
    @comment = get_comment
    if @comment.user == current_user and @comment.update_attributes(params[:comment])
      redirect_to @commentable
    end
  end

  def create
    @comment = @commentable.comments.build(params[:comment])
    if @comment.user = current_user and @comment.save
      redirect_to @commentable
    end
  end

  def destroy
    @comment = get_comment
    if @comment.user == current_user and @comment.destroy
      redirect_to @commentable
    end
  end

private
  def load_scope
    @commentable = get_commentable
  end

  def get_comment
    @commentable.comments.find(params[:id])
  end

  def get_commentable
    resource, id = request.path.split('/')[1, 2]
    resource.singularize.classify.constantize.find(id)
    # only if we need to scope certain commentable through current_user
    # if class_name.reflect_on_association(:user)
    #   current_user.send(resource).find(id)
    # else
    #   class_name.find(id)
    # end
  end
end