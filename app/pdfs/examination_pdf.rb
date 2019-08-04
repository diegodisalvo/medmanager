class ExaminationPdf
  # include instead of subclassing Prawn::Document as advised in official documentation
  include Prawn::View

  def initialize(exam)
    @document = Prawn::Document.new(page_size: 'A4')
    @exam = exam
    setup
    header
    intro
    content
    examination
    other
    conclusions

  end


  # This is the new method with font declaration
  def setup
    font_families.update("Quicksand" => {
      :normal => "vendor/assets/fonts/Quicksand-Regular.ttf",
      :bold => "vendor/assets/fonts/Quicksand-Bold.ttf"
    })
    font "Quicksand"
    line_width(0.5)
    font_size(10)
  end

  def header

    text_box "Allegato M - ACN/MG 23/3/2005", size: 10, at: [10, cursor]
    text_box "MODULARIO INFORMATIVO", size: 10, style: :bold, at: [200, cursor]
    text_box "Servizio Continuità Assistenziale", size: 10, at: [370, cursor]
    move_down(14)
    text_box "N. Intervento da registro: _____", size: 10, at: [370, cursor]
    move_down(20)
    stroke_horizontal_rule
  end

  def intro
    move_down(10)
    text_box "Regione: LOMBARDIA", at: [10, cursor]
    text_box "Provincia: BERGAMO", at: [150, cursor]
    text_box "ATS: ASST BG EST", at: [290, cursor]
    text_box "Sede: #{@exam.location.title.upcase}", at: [420, cursor]

    move_down(20)
    text_box "Medico: #{@exam.user.fullname.upcase}", at: [10, cursor]
    text_box "Data: #{@exam.exam_time.strftime('%d / %m / %Y')}", at: [180, cursor]
    text_box "Ora intervento: #{@exam.exam_time.strftime('%H : %M')}", at: [350, cursor]

    move_down(20)
    text_box "Tipo di intervento: #{@exam.exam_location}", at: [10, cursor]

    move_down(20)
    text_box "Località: #{@exam.exam_address}", at: [10, cursor]

    move_down(25)
    stroke_horizontal_rule
  end

  def content
    #relazione medica
    move_down(10)
    text_box "RELAZIONE MEDICA", style: :bold, at: [10, cursor]
    text_box "MOTIVI E CIRCOSTANZE", style: :bold, at: [200, cursor]
    move_down(20)
    text_box "#{@exam.situation}", at: [10, cursor]

    #Condizioni cliniche
    move_down(60)
    text_box "CONDIZIONI CLINICHE ALL'ARRIVO DEL MEDICO", style: :bold, at: [10, cursor]

    # PA
    move_down(20)
    text_box "P.A. #{@exam.pa_max} / #{@exam.pa_min} mmHg", at: [10, cursor]
    text_box "F.C. #{@exam.bpm} BPM", at: [170, cursor]
    text_box "F.R. #{@exam.breath_freq} BPM", at: [290, cursor]
    text_box "Temperatura: #{@exam.temperature} °C", at: [390, cursor]

    # Cute e altro
    move_down(20)
    text_box "Cute: #{@exam.skin}", at: [10, cursor]
    text_box "Nutrizione: #{@exam.nutrition}", at: [120, cursor]
    text_box "Idratazione: #{@exam.hydration}", at: [240, cursor]
    text_box "Idratazione: #{@exam.hydration}", at: [240, cursor]

    # Alvo e diuresi
    move_down(20)
    text_box "Alvo: #{@exam.alvo}", at: [10, cursor]
    text_box "Diuresi: #{@exam.diuresis}", at: [200, cursor]
  end

  def examination
    # BOXES
    bounding_box([0, 460],:width => 170,:height => 200) do
      stroke_bounds
      move_down(10)
      text_box 'SISTEMA NERVOSO', size: 10, style: :bold, at: [10, cursor]

      move_down(25)
      text_box 'Indenne', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Coscienza obnubilata', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Perdita di coscienza', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Stato di agitazione', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Convulsioni', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Romberg', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Rigor nucalis', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Deficit Motorio', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Deficit Sensitivo', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

      move_down(15)
      text_box 'Deviazione Sguardo', size: 10, at: [10, cursor]
      text_box ( @exam.nerv_normal ? 'X' : '-' ), size: 10, at: [140, cursor]

    end
    bounding_box([180, 460],:width => 170,:height => 200) do
      stroke_bounds
      move_down(10)
      text_box 'PUPILLE', size: 10, style: :bold, at: [10, cursor]
      text_box 'Dx', size: 10, style: :bold, at: [115, cursor]
      text_box 'Sx', size: 10, style: :bold, at: [145, cursor]

      move_down(18)
      text_box 'Normali', size: 10, at: [10, cursor]
      text_box ( @exam.pupils_normal_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.pupils_normal_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Miosi', size: 10, at: [10, cursor]
      text_box ( @exam.pupils_miosis_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.pupils_miosis_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Midriasi', size: 10, at: [10, cursor]
      text_box ( @exam.pupils_mydr_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.pupils_mydr_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'R. Fotomotorio', size: 10, at: [10, cursor]
      text_box ( @exam.pupils_fotoreflex_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.pupils_fotoreflex_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Nistagmo', size: 10, at: [10, cursor]
      text_box ( @exam.pupils_nystagmus_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.pupils_nystagmus_sx ? 'X' : '-' ), size: 10, at: [145, cursor]


      move_down(25)
      text_box 'APP. RESPIRATORIO', size: 10, style: :bold, at: [10, cursor]
      text_box 'Dx', size: 10, style: :bold, at: [115, cursor]
      text_box 'Sx', size: 10, style: :bold, at: [145, cursor]

      move_down(15)
      text_box 'Indenne', size: 10, at: [10, cursor]
      text_box ( @exam.lung_normal_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.lung_normal_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Rumori', size: 10, at: [10, cursor]
      text_box ( @exam.lung_rumor_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.lung_rumor_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Rumori secchi', size: 10, at: [10, cursor]
      text_box ( @exam.lung_dry_rumor_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.lung_dry_rumor_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Enfisema sottocut.', size: 10, at: [10, cursor]
      text_box ( @exam.lung_emphysema_dx ? 'X' : '-' ), size: 10, at: [115, cursor]
      text_box ( @exam.lung_emphysema_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

    end
    bounding_box([360, 460],:width => 170,:height => 200) do
      stroke_bounds
      move_down(10)
      text_box 'APP. CARDIOCIRCOLATORIO', size: 10, style: :bold, at: [10, cursor]

      move_down(14)
      text_box 'Normale', size: 10, at: [10, cursor]
      text_box ( @exam.heart_normal ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Aritmia', size: 10, at: [10, cursor]
      text_box ( @exam.heart_arhythmia ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Cianosi', size: 10, at: [10, cursor]
      text_box ( @exam.heart_cyanosis ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Edemi', size: 10, at: [10, cursor]
      text_box ( @exam.heart_edema ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(20)
      text_box 'ADDOME', size: 10, style: :bold, at: [10, cursor]

      move_down(15)
      text_box 'Murphy', size: 10, at: [10, cursor]
      text_box ( @exam.pupils_normal_sx ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Murphy', size: 10, at: [10, cursor]
      text_box ( @exam.abdomen_murphy ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Blumberg', size: 10, at: [10, cursor]
      text_box ( @exam.abdomen_blumberg ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Rovsing', size: 10, at: [10, cursor]
      text_box ( @exam.abdomen_rovsing ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Ascite', size: 10, at: [10, cursor]
      text_box ( @exam.abdomen_ascites ? 'X' : '-' ), size: 10, at: [145, cursor]

      move_down(15)
      text_box 'Giordano.', size: 10, at: [10, cursor]
      text_box ( @exam.abdomen_giordan_dx ? 'Dx: X' : 'Dx: -' ), size: 10, at: [105, cursor]
      text_box ( @exam.abdomen_giordan_sx ? 'Sx: X' : 'Sx: -' ), size: 10, at: [135, cursor]
    end
  end

  def other
    #Altro
    move_down(10)
    text_box "ALTRO", style: :bold, at: [10, cursor]
    move_down(15)
    text_box "#{@exam.other}", at: [10, cursor]

    #Terapia
    move_down(50)
    text_box "TERAPIA", style: :bold, at: [10, cursor]
    move_down(15)
    text_box "#{@exam.therapy}", at: [10, cursor]
    move_down(80)
    stroke_horizontal_rule
  end

  def conclusions
    move_down(5)
    text_box "ESITO INTERVENTO: ", style: :bold, at: [10, cursor]
    text_box "#{@exam.result}", style: :bold, at: [140, cursor]
    move_down(15)
    text_box "L'intervento " + (@exam.urgent ? '' : ' non ') + "presentava carattere di prestazione non differibile", at: [10, cursor]

    move_down(25)
    text_box "GENERALITA' ASSISTITO", style: :bold, at: [10, cursor]

    move_down(15)
    text_box "Nome e Cognome: #{@exam.patient.fullname}", at: [10, cursor]
    text_box "Sesso: #{@exam.patient.gender}", at: [270, cursor]
    text_box "Età: #{@exam.patient.age}", at: [330, cursor]
    text_box "C.F.: #{@exam.patient.fiscalcode}", at: [380, cursor]

    move_down(15)
    text_box "Residenza in via: #{@exam.patient.address}", at: [10, cursor]
    text_box "Città: #{@exam.patient.city}", at: [270, cursor]
    text_box "Provincia: #{@exam.patient.province}", at: [420, cursor]
  end
end
