class PetsController < ApplicationController

  def home
  end

  def index
    @pets = Pet.all
    @pets.each do |pet|
      if pet.species == "Cat"
        pet.species = '🐱'
      elsif
        pet.species == "Dog"
        pet.species = '🐶'
      elsif
        pet.species == "Lizard"
        pet.species = '🦎'
      else
        pet.species = '🐥'
      end
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pets_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pets_params)
      redirect_to pets_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path status: :see_other
  end

  private

  def pets_params
    params.require(:pet).permit(:name, :address, :species, :found_on)
  end
end
