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
    @photo.user = current_user
    if @photo.save
      redirect_to photos_path
    else
      render "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = Comment.where(photo_id: params[:photo_id])
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
    if current_user.id == @photo.user.id
      @photo.destroy
      flash[:notice] = "Photo deleted!"
      redirect_to photos_path
    end
  end

  def upvote
    @photo = Photo.find(params[:id])
    @photo.upvote_by current_user
    redirect_to root_path
  end

  def downvote
    @photo = Photo.find(params[:id])
    @photo.downvote_by current_user
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :avatar)
  end

end
