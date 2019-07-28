class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.order(title: :asc)
  end

  def show
    @location = Location.find(params[:id])
    @exams = @location.examinations.group_by_day(:exam_time).count
    @nExams = @location.examinations.joins(:patient).count(:patient_id)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "Sede aggiunta con successo"
      redirect_to location_path(@location)
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    flash[:notice] = "Dati sede aggiornati"
    redirect_to location_path(@location)
  end

  def delete
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location = Location.destroy
    flash[:notice] = "Sede eliminata"
    redirect_to root_path
  end

  private
  def location_params
    params.require(:location).permit(:title, :address)
  end
end
