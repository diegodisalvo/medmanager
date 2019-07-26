class CreateExaminations < ActiveRecord::Migration[6.0]
  def change
    create_table :examinations do |t|
      t.text :situation, default: ""
      t.integer :pa_max, default: 120
      t.integer :pa_min, default: 80
      t.integer :bpm, default: 80
      t.integer :breath_freq, default: 12
      t.float :temperature, default: 36.0
      t.string :skin, default: "normale"
      t.string :hydration, default: "normale"
      t.string :nutrition, default: "normale"
      t.string :diuresis, default: "normale"
      t.string :alvo, default: "regolare"
      t.boolean :nerv_normal, default: true
      t.boolean :nerv_cosc_clouded, default: false
      t.boolean :nerv_cosc_absent, default: false
      t.boolean :nerv_convulsion, default: false
      t.boolean :nerv_romberg, default: false
      t.boolean :nerv_rigor, default: false
      t.boolean :nerv_motor_deficit, default: false
      t.boolean :nerv_sens_deficit, default: false
      t.boolean :pupils_normal_sx, default: true
      t.boolean :pupils_miosis_sx, default: false
      t.boolean :pupils_mydr_sx, default: false
      t.boolean :pupils_fotoreflex_sx, default: false
      t.boolean :pupils_nystagmus_sx, default: false
      t.boolean :pupils_normal_dx, default: true
      t.boolean :pupils_miosis_dx, default: false
      t.boolean :pupils_mydr_dx, default: false
      t.boolean :pupils_fotoreflex_dx, default: false
      t.boolean :pupils_nystagmus_dx, default: false
      t.boolean :lung_normal_sx, default: true
      t.boolean :lung_rumor_sx, default: true
      t.boolean :lung_dry_rumor_sx, default: true
      t.boolean :lung_emphysema_sx, default: true
      t.boolean :lung_normal_dx, default: true
      t.boolean :lung_rumor_dx, default: true
      t.boolean :lung_dry_rumor_dx, default: true
      t.boolean :lung_emphysema_dx, default: true
      t.boolean :heart_normal, default: true
      t.boolean :heart_arhythmia, default: false
      t.boolean :heart_cyanosis, default: false
      t.boolean :heart_edema, default: false
      t.boolean :abdomen_murphy, default: false
      t.boolean :abdomen_blumberg, default: false
      t.boolean :abdomen_rovsing, default: false
      t.boolean :abdomen_ascites, default: false
      t.boolean :abdomen_giordan_sx, default: false
      t.boolean :abdomen_giordan_dx, default: false
      t.text :other, default: ""
      t.text :therapy, default: ""
      t.string :result, default: ""
      t.boolean :urgent, default: false
      t.timestamps
    end
  end
end
