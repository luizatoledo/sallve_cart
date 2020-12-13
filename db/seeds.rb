# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

# Creating Products on DB

# Sérum Antiacne
antiacne = Product.create!(name: 'Sérum Antiacne')
antiacne_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sa-carrossel-SA-sozinho.jpg?v=1607456887')
antiacne.photo.attach(io: antiacne_pic, filename:'antiacne.png', content_type: 'image/png')

# Antioxidante Hidratante
antiox = Product.create!(name: 'Antioxidante Hidratante')
antiox_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-antioxidante-hidratante-1.jpg?v=1605127205')
antiox.photo.attach(io: antiox_pic, filename:'antiox.png', content_type: 'image/png')

# Tônico Renovador
tonico = Product.create!(name: 'Tônico Renovador')
tonico_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-TR-detalhe-produto-1_b3c5d09d-50bf-4dd5-9fd4-5b8784aba128.jpg?v=1602079660')
tonico.photo.attach(io: tonico_pic, filename:'tonico.png', content_type: 'image/png')

# Exfoliante Enzimático
exfoliante = Product.create!(name: 'Exfoliante Enzimático')
exfoliante_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-esfoliante-enzimatico-1-a.jpg?v=1597658287')
exfoliante.photo.attach(io: exfoliante_pic, filename:'exfoliante.png', content_type: 'image/png')

# Hidratante Firmador
firmador = Product.create!(name: 'Hidratante Firmador')
firmador_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-hidratante-firmador.jpg?v=1597658578')
firmador.photo.attach(io: firmador_pic, filename:'firmador.png', content_type: 'image/png')

# Limpador Facial
limpador = Product.create!(name: 'Limpador Facial')
limpador_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-limpador-facial-1.jpg?v=1597658319')
limpador.photo.attach(io: limpador_pic, filename:'limpador.png', content_type: 'image/png')

# Hidratante Labial
labial = Product.create!(name: 'Hidratante Labial')
labial_pic = URI.open('https://cdn.shopify.com/s/files/1/0074/3486/2639/products/sallve-hidratante-labial-1.jpg?v=1605541986')
labial.photo.attach(io: labial_pic, filename:'labial.png', content_type: 'image/png')

# Bálsamo Demaquilante
demaquilante = Product.create!(name: 'Bálsamo Demaquilante')
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

# # Carts
# cart = Cart.create!

# # Cart_skus
# cart_sku_1 = CartSku.new
# cart_sku_1.cart = cart
# cart_sku_1.sku = sku_limpador
# cart_sku_1.amount = 2
# cart_sku_1.save!

# cart_sku_2 = CartSku.new
# cart_sku_2.cart = cart
# cart_sku_2.sku = sku_labial
# cart_sku_2.amount = 1
# cart_sku_2.save!

# cart_sku_3 = CartSku.new
# cart_sku_3.cart = cart
# cart_sku_3.sku = sku_demaquilante
# cart_sku_3.amount = 1
# cart_sku_3.save!