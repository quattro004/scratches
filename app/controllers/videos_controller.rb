require 'RMagick'
include Magick

class VideosController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def create
    @video.user_id = user_signed_in? ? current_user.id : 0
    flash[:notice] = 'video was successfully created.' if @video.save
    redirect_to(album_path(@video.imageable_id))
  end

  def destroy
    @video.destroy
    flash[:notice] = 'Successfully destroyed video.'
    redirect_to(album_path(@video.imageable_id))
  end

  def new
    @video.album_id = params[:album_id]
    respond_with(@video)
  end

  def show
    @video = Video.find(params[:id])
    send_data(@video.data,
      :filename => @video.name,
      :type => @video.content_type,
      :disposition => "inline" )
  end

  def update
    @video.update_attributes(params[:video])
    redirect_to(album_path(@video.imageable_id))
  end

end
