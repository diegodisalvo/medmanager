class ChangeDefaultsForLungsAndMore < ActiveRecord::Migration[6.0]
  def change
    change_column_default :examinations, :lung_rumor_dx, false
    change_column_default :examinations, :lung_rumor_sx, false
    change_column_default :examinations, :lung_dry_rumor_dx, false
    change_column_default :examinations, :lung_dry_rumor_sx, false
    change_column_default :examinations, :lung_emphysema_dx, false
    change_column_default :examinations, :lung_emphysema_sx, false


    change_column_default :examinations, :heart_arhythmia, false
    change_column_default :examinations, :heart_cyanosis, false
    change_column_default :examinations, :heart_edema, false

    change_column_default :examinations, :abdomen_murphy, false
    change_column_default :examinations, :abdomen_blumberg, false
    change_column_default :examinations, :abdomen_rovsing, false
    change_column_default :examinations, :abdomen_ascites, false
    change_column_default :examinations, :abdomen_giordan_dx, false
    change_column_default :examinations, :abdomen_giordan_sx, false

  end
end
