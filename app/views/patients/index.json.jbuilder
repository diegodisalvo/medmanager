json.array! @patients do |patient|
  json.fiscalcode patient.fiscalcode
  json.name patient.fullname + ' - ' + patient.fiscalcode
  # json.name patient.fiscalcode + ' - ' + patient.fullname
end
