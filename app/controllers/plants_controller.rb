# class PlantController < ApplicationController
# end

# class PlantsController < ApplicationController

#   def index
#     plants = Plant.all
#     render json: plants
#   end
  
#   def show
#     plant = Plant.find(params[:id])
#     render json: plant
#   end
  
#   def create
#        plant = Plant.new(plant_params)
#   if plant.save
#       render json: plant, status: :created
#   else
#        render json: { error: plant.errors.full_messages }, status: :unprocessable_entity
#   end
#   end
  
#
  
class PlantsController < ApplicationController
  before_action :set_plant, only: [:show]

  def index
    plants = Plant.all
    render json: plants, status: :ok
  end

  def show
    render json: @plant, status: :ok
  end

  def create
    plant = Plant.new(plant_params)

    if plant.save
      render json: plant, status: :created
    else
      render json: { error: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Plant with ID #{params[:id]} not found" }, status: :not_found
  end

  def plant_params
    params.require(:plant).permit(:name, :image, :price)
  end
end

