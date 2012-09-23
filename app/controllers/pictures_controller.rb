require 'RMagick'
include Magick

# Responsible for manipulating pictures.
class PicturesController < ApplicationController
  respond_to :html, :xml, :json

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
end
