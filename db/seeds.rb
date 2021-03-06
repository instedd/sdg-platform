# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(email: 'admin@instedd.org',
  name: 'Administrator',
  password: '12345678',
  password_confirmation: '12345678',
  confirmed_at: DateTime.now,
  admin: true)

org_user = User.create(email: 'user@ngo.org',
  name: 'NGO project manager',
  password: '12345678',
  password_confirmation: '12345678',
  confirmed_at: DateTime.now)


Organization.create(name: "NGO", twitter: "@ngo", email: "info@ngo.org", user: org_user)

[
  ["Buenos Aires", "BA"],
  ["Catamarca", "CAT"],
  ["Chaco", "CHO"],
  ["Chubut", "CHT"],
  ["Ciudad de Buenos Aires", "CABA"],
  ["Córdoba", "CBA"],
  ["Corrientes", "COR"],
  ["Entre Ríos", "ER"],
  ["Formosa", "FSA"],
  ["Jujuy", "JUJ"],
  ["La Pampa", "LP"],
  ["La Rioja", "LR"],
  ["Mendoza", "MZA"],
  ["Misiones", "MIS"],
  ["Neuquén", "NEU"],
  ["Río Negro", "RN"],
  ["Salta", "SAL"],
  ["San Juan", "SJ"],
  ["San Luis", "SL"],
  ["Santa Cruz", "SC"],
  ["Santa Fe", "SF"],
  ["Santiago del Estero", "SE"],
  ["Tierra del Fuego", "TF"],
  ["Tucumán", "TUC"]
].each do |name, code|
  Location.create name: name, code: code
end

[
  "Primera infancia",
  "Niñas/os",
  "Adolescentes",
  "Jóvenes",
  "Adultos",
  "Adultos mayores",
  "Mujeres",
  "Migrantes",
  "Pueblos Originarios",
  "Población Rural",
  "Personas con discapacidad",
  "Personas en situación de calle",
  "LGBTI",
  "Otros"
].each do |pop|
  Population.create name: pop
end
