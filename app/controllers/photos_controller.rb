class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(params[:photo])
    if @photo.save
      redirect_to photos_path
    end
  end

  def edit
    @photo = get_photo
  end

  def update
    @photo = get_photo
    if @photo.update_attributes(params[:photo])
      redirect_to photos_path
    end
  end

  def destroy
    @photo = get_photo
    if @photo.destroy
      redirect_to photos_path
    end
  end

private
  def get_photo
    current_user.photos.find(params[:id])
  end
end