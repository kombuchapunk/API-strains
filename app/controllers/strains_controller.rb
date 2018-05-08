class StrainsController < ApplicationController
  def index
    @strains = Strain.all
    json_response(@strains)
  end

  def show
    @strain = Strain.find(params[:id])
    json_response(@strain)
  end

private
  def json_response(object)
    render json: object, status: :ok
  end
end
