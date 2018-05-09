class RatingsController < ApplicationController

  def show
    @rating = Rating.find(params[:id])
  end

  def create
    strain = Strain.find(params[:strain_id])
    strain.ratings.create!(rating_params)
  end

  private
  def rating_params
    params.permit(:rating)
  end
end
