class TreatmentsController < ApplicationController
  # def index
  #   @pet = current_user.pet.find(params[:id])
  #   @needs = @pet.need.all
  # end

  def new
    # @pet = Pet.find(params[:need_id])
    @treatment = Treatment.new
  end

  def create
    @need = Need.find(params[:need_id])
    @pet = @need.pet
    @treatment = @need.treatments.create(treatment_params)

    redirect_to pet_path(@pet)
  end

  # def show
  #   @pet = current_user.pet.find(params[:id])
  #   @need = Need.find(params[:id])
  # end

  def edit
    @treatment = Treatment.find(params[:id])
  end

  def update
    @need = Need.find(params[:need_id])
    @pet = @need.pet
    @treatment = Treatment.find(params[:id])
    @treatment.update(treatment_params)

    redirect_to pet_path( @pet )
  end

  def destroy
    @need = Need.find(params[:need_id])
    @pet = @need.pet
    @treatment = Treatment.find(params[:id])
    @treatment.destroy

    redirect_to pet_path( @pet )
  end

  private
  def treatment_params
    # params.require(:need).permit(:pet_id)
    params.require(:treatment).permit(:medicine, :dosage, :every, :created_at, :updated_at, :need_id, :notes)
  end
end
