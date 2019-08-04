class ExaminationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @examinations = Examination.all
    authorize!
  end

  def show
    @examination = Examination.find(params[:id])
    respond_to do |format|
      format.html

      format.pdf do
        pdf = ExaminationPdf.new(@examination)
        send_data pdf.render, filename: 'moduloM.pdf', type: 'application/pdf', disposition: 'inline'
      end

    end
  end

  def new
    if current_user.location.present?
      @patient = Patient.find(params[:patient_id])
      @examination = Examination.new
      authorize! @examination
    else
      flash[:alert] = "Prima di procedere è necessario selezionare una sede operativa"
      redirect_to user_path(current_user)
    end
  end

  def create
    @patient = Patient.find(params[:examination][:patient_id])
    user = User.find(current_user.id)
    location = Location.find(current_user.location.id)
    @examination = Examination.new(examination_params)
    @examination.patient = @patient
    @examination.user = user
    @examination.location = location
    if @examination.save
      flash[:notice] = "Esame salvato"
      redirect_to examination_path(@examination)
    end
  end

  def edit
    @examination = Examination.find(params[:id])
    @patient = @examination.patient
  end

  def update
    @examination = Examination.find(params[:id])
    @examination.update(examination_params)
    flash[:notice] = "Esame aggiornato correttamente"
    redirect_to examination_path(@examination)
  end

  private
  def examination_params
    params.require(:examination).permit(:situation,
                                        :pa_max,
                                        :pa_min,
                                        :bpm,
                                        :breath_freq,
                                        :temperature,
                                        :skin,
                                        :hydration,
                                        :nutrition,
                                        :diuresis,
                                        :alvo,
                                        :nerv_normal,
                                        :nerv_cosc_clouded,
                                        :nerv_cosc_absent,
                                        :nerv_convulsion,
                                        :nerv_romberg,
                                        :nerv_rigor,
                                        :nerv_motor_deficit,
                                        :nerv_sens_deficit,
                                        :pupils_normal_sx,
                                        :pupils_miosis_sx,
                                        :pupils_mydr_sx,
                                        :pupils_fotoreflex_sx,
                                        :pupils_nystagmus_sx,
                                        :pupils_normal_dx,
                                        :pupils_miosis_dx,
                                        :pupils_mydr_dx,
                                        :pupils_fotoreflex_dx,
                                        :pupils_nystagmus_dx,
                                        :lung_normal_sx,
                                        :lung_rumor_sx,
                                        :lung_dry_rumor_sx,
                                        :lung_emphysema_sx,
                                        :lung_normal_dx,
                                        :lung_rumor_dx,
                                        :lung_dry_rumor_dx,
                                        :lung_emphysema_dx,
                                        :heart_normal,
                                        :heart_arhythmia,
                                        :heart_cyanosis,
                                        :heart_edema,
                                        :abdomen_murphy,
                                        :abdomen_blumberg,
                                        :abdomen_rovsing,
                                        :abdomen_ascites,
                                        :abdomen_giordan_sx,
                                        :abdomen_giordan_dx,
                                        :other,
                                        :therapy,
                                        :result,
                                        :urgent,
                                        :patient_id,
                                        :user_id,
                                        :requested_by,
                                        :exam_time,
                                        :exam_location,
                                        :location_id,
                                        :exam_address
                                      )
  end
end
