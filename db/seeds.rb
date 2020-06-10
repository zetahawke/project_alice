# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@importer.com', password: 'password', password_confirmation: 'password') unless User.find_by(email: 'admin@importer.com')

[
  'S', 'M', 'L', 'XL', 'XXL', 'nuevo', 'viejo', 'usado', 'abierto', 'limpieza', 'living',
  'comedor', 'baño', 'cocina', 'piezas', 'infantiles', 'mural', 'sobremesa', 'interior',
  'exterior',
  'amarillo', 'ámbar', 'añil', 'azul', 'azul claro',
  'azul eléctrico ', 'azul marino ', 'beis', 'bermellón', 'blanco ', 'blanco marfil',
  'burdeos', 'café', 'caoba o rojo indio ', 'caqui  ', 'carmesí ', 'castaño', 'celeste ',
  'cereza', 'champán', 'chartreuse o cartujo', 'cian', 'cobre', 'color terracota o teja',
  'coral  ', 'crema  ', 'fucsia', 'granate ', 'gris', 'gris perla', 'gris zinc', 'gualdo',
  'hueso', 'lavanda', 'lila', 'magenta', 'marrón', 'marrón chocolate', 'morado', 'naranja',
  'negro', 'ocre', 'ocre claro', 'ocre oscuro', 'oro o dorado ', 'pardo', 'plata  ', 'púrpura',
  'rojo', 'rojo carmín', 'rojo óxido', 'rosa ', 'rosa palo', 'salmón  ', 'turquesa', 'verde',
  'verde botella  ', 'verde esmeralda', 'verde lima', 'verde manzana  ', 'verde musgo',
  'verde oliva', 'verde pistacho', 'verdeagua o aguamarina ', 'violeta', 'vino'
].each { |name| Tag.create!(name: name) unless Tag.find_by(name: name) }

[
  'hogar', 'juegos', 'limpieza', 'decoración', 'ocio'
].each { |name| Category.create!(name: name, description: "Articulos para #{name}") unless Category.find_by(name: name) }