class PhotosController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_url
  end

  def show
    @photo = Photo.find(params[:id])
    @image_url = @photo.avatar.url(:medium)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  def upvote
    @photo = Photo.find(params[:id])
    @photo.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @photo = Photo.find(params[:id])
    @photo.downvote_by current_user
    redirect_to :back
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :avatar)
  end

end
