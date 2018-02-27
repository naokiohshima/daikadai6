class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to events_url

  end

  def destroy
    favorite = current_user.favorites.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url
  end
end
