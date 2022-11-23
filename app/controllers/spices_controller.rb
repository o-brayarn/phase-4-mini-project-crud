class SpicesController < ApplicationController
  wrap_parameters format: []

  def index
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    #find the id
    spice = find_spice
    #update
    spice.update(spice_params)
    #render json data
    render json: spice, status: :created
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private

  def spice_params
    params.permit(:title, :description, :image, :notes, :rating)
  end

  def find_spice
    Spice.find_by(id: params[:id])
  end
end
