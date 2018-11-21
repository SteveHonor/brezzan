class AlbumsController < ApplicationController
  def index
    @albums = Album.where(event_id: params[:event_id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params.merge(event_id: params[:event_id]))

    if @album.valid?
      @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.assign_attributes(album_params)

    if @album.valid?
      @album.save
      redirect_to @album
    else
      render :show
    end
  end

  def delete
    @album.destroy
    redirect_to action: :index
  end

  private

  def album_params
    params.require(:album).permit!
  end
end
