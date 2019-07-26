class ExaminationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @examinations = Examination.all
    authorize!
  end

  def show
    @examination = Examination.find(params[:id])
  end

  def new
    @examination = Examination.new
    authorize! @examination
  end

  def create
    @examination = Examination.new(examination_params)
    if @examination.save
      flash[:notice] = "Esame salvato"
      redirect_to examination_path(@examination)
    end
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
                                        :requested_by
                                      )
  end
end
