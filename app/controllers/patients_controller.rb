class PatientsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :search, :show, :edit, :create, :update, :delete, :destroy]
  require 'json'
  require 'open-uri'

  def start
  end

  def home
    if !user_signed_in?
      redirect_to start_patients_path
    end
  end

  def index
    @patients = Patient.order(lname: :asc)
    if params.has_key?(:q)
      @patients = Patient.search_name(params[:q])
    end
    if params.has_key?(:search)
      @patients = Patient.search_name(params[:search][:query]).order(lname: :asc)
    end
    authorize!

    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    if params.has_key?(:search)
      @patients = Patient.search_fiscalcode(params[:search][:query]).order(lname: :asc)
      respond_to do |format|
        format.js do
          if @patients.blank?
            @after_form = true
            render 'new'
          else
            render 'search'
          end
        end
      end
    end
    authorize!
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
      if params[:patient][:create_patient_and_exam]
        redirect_to new_examination_path(patient_id: @patient)
      else
        redirect_to patient_path(@patient)
      end
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    flash[:notice] = "Dati paziente aggiornati"
    redirect_to patient_path(@patient)
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
                                    :province,
                                    :birth_date,
                                    :anamnesis,
                                    :eo,
                                    :notes
                                  )
  end
end
