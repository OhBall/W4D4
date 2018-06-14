class TracksController < ApplicationController
  before_action :ensure_logged_in

  def new
    render :new
  end



end
