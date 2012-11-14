require 'RMagick'
include Magick

# Responsible for manipulating pictures.
class PicturesController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def create
    @picture.user_id = user_signed_in? ? current_user.id : 0
    flash[:notice] = 'Picture was successfully created.' if @picture.save
    respond_with_picture_or_album
  end

  def destroy
    @picture.destroy
    flash[:notice] = 'Successfully destroyed picture.'
    respond_with_picture_or_album
  end

  def new
    @picture.album_id = params[:album_id]
    respond_with(@picture)
  end

  def show
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
      :filename => @picture.name,
      :type => @picture.content_type,
      :disposition => "inline" )
  end

  def thumbnail
    @picture = Picture.find(params[:id])
    @image = Image.from_blob(@picture.data).first
    width = params[:width] == nil ? 64 : params[:width].to_i
    height = params[:height] == nil ? 64 : params[:height].to_i

    send_data(@image.thumbnail(width, height).to_blob,
      :filename => @picture.name,
      :type => @picture.content_type,
      :disposition => "inline" )
  end

  private

    def respond_with_picture_or_album
      if (@picture.album_id == nil || @picture.album_id <= 0)
        respond_with(@picture)
      else
        redirect_to(album_path(@picture.album_id))
      end
    end
end
