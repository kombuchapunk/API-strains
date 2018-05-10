class StrainsController < ApplicationController
  def index
    @strains = Strain.where(nil)
    @strains = @strains.search_by_effects(params[:effects])  if params[:effects].present?
    @strains = @strains.search_by_flavors(params[:flavors])  if params[:flavors].present?
    @strains = @strains.search_by_rating(params[:rating])  if params[:rating].present?
    json_response(@strains)
  end

  def show
    @strain = Strain.find(params[:id])
    json_response(@strain)
  end

  def create
    @strain = Strain.create(strain_params)
    json_response(@strain)
  end

  def update
    @strain = Strain.find(params[:id])
    @strain.update(strain_params)
  end

  def destroy
    @strain = Strain.find(params[:id])
    @strain.destroy
  end

private
  def strain_params
    params.permit(:name, :description, :strain_flavors, :strain_effects, :type_name)
  end
  def json_response(object)
    render json: object, status: :ok
  end
end
