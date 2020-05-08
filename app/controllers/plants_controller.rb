class PlantsController < ApplicationController
  # before_action :set_plant, only: [:show, :update, :destroy]
  # GET /plants
  def index
    @plants = Plant.all
    render json: @plants
  end
  # GET /plants/1
  def show
    render json: @plant
  end
  # POST /plants
  def create
    # @plant = Plant.new(plant_params)
    # if @plant.save
    #   render json: @plant, status: :created, location: @plant
    # else
    #   render json: @plant.errors, status: :unprocessable_entity
    # end
    @plant = Plant.create(plant_params)
    render({json: @plant, status: :created})
  end
  # PATCH/PUT /plants/1
  def update
    if @plant.update(plant_params)
      render json: @plant
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end
  # DELETE /plants/1
  def destroy
    @plant.destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def plant_params
      # params.fetch(:plant, {})
      params.require(:plant).permit(:common_name, :latin_name)
    end
end