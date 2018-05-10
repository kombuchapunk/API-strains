class RatingsController < ApplicationController

  def show
    @rating = Rating.find(params[:id])
    json_response(@rating)
  end

  def create
    # should validate that rating is between 1-5
    strain = Strain.find(params[:strain_id])
    rating = strain.ratings.create!(rating_params)
    json_response(rating)
  end

  private
  def rating_params
    params.permit(:rating)
  end

  def json_response(object)
    render json: object, status: :ok
  end

end
