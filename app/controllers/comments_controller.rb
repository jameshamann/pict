class CommentsController < ApplicationController

  def index
    @photo = Photo.find(params[:photo_id])
    @comments = Comment.where(photo_id: params[:photo_id])
    @image_url = @photo.avatar.url(:medium)
  end

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to photo_comments_path
    else
      redirect_to new_photo_comment_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @photo = Photo.find(params[:photo_id])
  end

  def update
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to photo_comments_path
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to photo_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
