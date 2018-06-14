class TracksController < ApplicationController
  before_action :ensure_logged_in

  def new
    render :new
  end

  def create
    track = Track.new(track_params)
    if track.save
      redirect_to track_url(track)
    else
      flash.now[:error] = track.errors.full_messages
      render :new
    end
  end

  def show
    @track = current_track
    render :show
  end

  def edit
    @track = current_track
    render :edit
  end

  

  private
  def track_params
    params.require(:track).permit(:title, :ord, :bonus, :lyrics, :album_id)
  end

  def current_track
    Track.find(params[:id])
  end
end
