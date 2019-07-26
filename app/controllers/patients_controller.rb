class PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.order(lname: :asc)
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "Paziente aggiunto correttamente"
      redirect_to patient_path(@patient)
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    flash[:notice] = "Dati paziente aggiornati"
  end

  def delete
    @patient = Patient.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(:fname,
                                    :lname,
                                    :fiscalcode,
                                    :address,
                                    :city,
                                    :province
                                  )
  end
end
