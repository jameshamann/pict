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

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :avatar)
  end

end
