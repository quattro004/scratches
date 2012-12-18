require 'RMagick'
include Magick

# Responsible for manipulating pictures.
class PicturesController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def create
    @picture.user_id = user_signed_in? ? current_user.id : 0
    flash[:notice] = 'Picture was successfully created.' if @picture.save
    respond_or_redirect
  end

  def destroy
    @picture.destroy
    flash[:notice] = 'Successfully destroyed picture.'
    respond_or_redirect
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

    @image.change_geometry!("#{width}x#{height}") { |cols, rows, img|
      img.resize!(cols, rows)
    }
    send_data(@image.to_blob,
      :filename => @picture.name,
      :type => @picture.content_type,
      :disposition => "inline" )
  end

  private

    def respond_or_redirect
      if (@picture.album_id != nil && @picture.album_id > 0)
        redirect_to(album_path(@picture.album_id))
      elsif (@picture.recipe_id != nil && @picture.recipe_id > 0)
        redirect_to(recipe_path(@picture.recipe_id))
      else
        respond_with(@picture)
      end
    end
end
