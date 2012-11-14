class PostsController < ApplicationController  
  def index
    @posts = Post.all
  end

  def show
    @post = get_post
  end

  def edit
    @post = get_post
  end

  def new
    @post = Post.new
  end

  def update
    @post = get_post
    if @post.update_attributes(params[:post])
      redirect_to posts_path
    else
      render :edit
    end
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to(posts_path)
    else
      render :new 
    end
  end

  def destroy
    @post = get_post
    flash[:notice] = "Post could not be deleted" unless @post.destroy
    redirect_to posts_path
  end

private

  def get_post
    Post.find(params[:id])
  end
end