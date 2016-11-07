class PhotosController < ApplicationController

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
    redirect_to "/photos/#{@photo.id}"
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to '/photos'
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :avatar)
  end

end
