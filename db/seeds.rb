# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

# Deleting existing Structures
CartSku.delete_all
Sku.delete_all
Product.delete_all

# Creating Products on DB

# Sérum Antiacne
antiacne = Product.create!(name: 'sérum antiacne')
antiacne_pic = File.open('../app/assets/images/antiacne.jpg')
antiacne.photo.attach(io: antiacne_pic, filename:'antiacne.png', content_type: 'image/png')

# Antioxidante Hidratante
antiox = Product.create!(name: 'antioxidante hidratante')
antiox_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-antioxidante-hidratante-1.jpg?v=1605127205')
antiox.photo.attach(io: antiox_pic, filename:'antiox.png', content_type: 'image/png')

# Tônico Renovador
tonico = Product.create!(name: 'tônico renovador')
tonico_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-TR-detalhe-produto-1_b3c5d09d-50bf-4dd5-9fd4-5b8784aba128.jpg?v=1602079660')
tonico.photo.attach(io: tonico_pic, filename:'tonico.png', content_type: 'image/png')

# Exfoliante Enzimático
exfoliante = Product.create!(name: 'exfoliante enzimático')
exfoliante_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-esfoliante-enzimatico-1-a.jpg?v=1597658287')
exfoliante.photo.attach(io: exfoliante_pic, filename:'exfoliante.png', content_type: 'image/png')

# Hidratante Firmador
firmador = Product.create!(name: 'hidratante firmador')
firmador_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-hidratante-firmador.jpg?v=1597658578')
firmador.photo.attach(io: firmador_pic, filename:'firmador.png', content_type: 'image/png')

# Limpador Facial
limpador = Product.create!(name: 'limpador facial')
limpador_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-limpador-facial-1.jpg?v=1597658319')
limpador.photo.attach(io: limpador_pic, filename:'limpador.png', content_type: 'image/png')

# Hidratante Labial
labial = Product.create!(name: 'hidratante labial')
labial_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-hidratante-labial-1.jpg?v=1605541986')
labial.photo.attach(io: labial_pic, filename:'labial.png', content_type: 'image/png')

# Bálsamo Demaquilante
demaquilante = Product.create!(name: 'bálsamo demaquilante')
demaquilante_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/balsamo-demaquilante-1.jpg?v=1601986306')
demaquilante.photo.attach(io: demaquilante_pic, filename:'demaquilante.png', content_type: 'image/png')

# Skus 
sku_antiacne = Sku.new(sku: 1, inventory: 10, price: 59.9)
sku_antiacne.product = antiacne
sku_antiacne.save!

sku_antiox = Sku.new(sku: 2, inventory: 5, price: 89.9)
sku_antiox.product = antiox
sku_antiox.save!

sku_tonico = Sku.new(sku: 3, inventory: 2, price: 54.9)
sku_tonico.product = tonico
sku_tonico.save!

sku_exfoliante = Sku.new(sku: 4, inventory: 9, price: 59.9)
sku_exfoliante.product = exfoliante
sku_exfoliante.save!

sku_firmador = Sku.new(sku: 5, inventory: 0, price: 99.9)
sku_firmador.product = firmador
sku_firmador.save!

sku_limpador = Sku.new(sku: 6, inventory: 5, price: 54.9)
sku_limpador.product = limpador
sku_limpador.save!

sku_labial = Sku.new(sku: 7, inventory: 8, price: 24.9)
sku_labial.product = labial
sku_labial.save!

sku_demaquilante = Sku.new(sku: 8, inventory: 4, price: 69.9)
sku_demaquilante.product = demaquilante
sku_demaquilante.save!
