class AlbumsController < ApplicationController
  respond_to :html, :xml, :json
  attr_reader :current_album_type, :author_name
  load_and_authorize_resource

  def index
    @albums = Album.by_type params[:album_type]
    respond_with(@albums)
  end

  def show
    get_current_album_type
    get_author_name
    if @current_album_type.name.singularize == 'Picture'
      @album_pictures = @album.pictures.paginate(:page => params[:page], :per_page => 12)
    elsif @current_album_type.name.singularize == 'Video'
      @album_videos = @album.videos.paginate(:page => params[:page], :per_page => 12)
    end
    respond_with(@album)
  end

  def new
    @album.album_type_id = params[:album_type]
    get_current_album_type
    respond_with(@album)
  end

  def edit
    get_current_album_type
    respond_with(@album)
  end

  def create
    @album.user_id = user_signed_in? ? current_user.id : 0
    flash[:notice] = 'Album was successfully created.' if @album.save
    get_current_album_type
    respond_with(@album)
  end

  def update
    @album.update_attributes(params[:album])
    respond_with(@album)
  end

  def destroy
    @album.destroy
    flash[:notice] = 'Successfully destroyed album.'
    redirect_to albums_path(:album_type => @album.album_type_id)
  end

  private

    def get_current_album_type
      @current_album_type = AlbumType.all.find { |album_type| album_type.id == @album.album_type_id }
    end

    def get_author_name
      @author_name = (@album.user_id > 0) \
        ? User.find { |user| user.id == @album.user_id }.name \
        : 'Anonymous'
    end
end
