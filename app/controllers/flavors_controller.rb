class FlavorsController < ApplicationController
  def index
    @flavors = Flavor.all
    json_response(@flavors)
  end

  def show
    @strains = Flavor.find(params[:id]).strains
    json_response(@strains)
  end

private
  def json_response(object)
    render json: object, status: :ok
  end
end
