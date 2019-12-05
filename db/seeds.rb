# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_random_user(user_array) (user_array)
  nb_user = user_array.count
  user_array[rand(1..nb_user-1).round]
end

def get_random_service(service_array) (service_array)
  nb_service = service_array.count
  service_array[rand(1..nb_service-1).round]
end


puts "begining of seed"
puts "Deleting Review"
Review.destroy_all
puts "Deleting Notifications"
Notification.destroy_all
puts "Deleting Cotisations"
Cotisation.destroy_all
puts "subscriptions destroyed"
Subscription.destroy_all
puts "Services destroyed"
Service.destroy_all
puts "Users Destroy"
User.destroy_all


puts "creating new users"

remi = User.create!(email: 'remi.cordo@gmail.com', password: 'azerty', first_name: 'Rémi', last_name: 'Cordonnier', phone_number: '0688977942', cagnotte: 0)
remi.remote_photo_url = "https://avatars3.githubusercontent.com/u/51714799?v=4"
remi.save!

olivier = User.create!(email: 'olivier@gmail.com', password: 'azerty', first_name: 'Olivier', last_name: 'Matthey', phone_number: '0677333977')
olivier.remote_photo_url = "https://avatars3.githubusercontent.com/u/52571009?v=4"
olivier.save!

antoine = User.create!(email: 'antoine@gmail.com', password: 'azerty', first_name: 'Arthur', last_name: 'Lemaire', phone_number: '067711977')
antoine.remote_photo_url = "https://avatars1.githubusercontent.com/u/54395152?v=4"
antoine.save!

martin = User.create!(email: 'martin@hotmail.com', password: 'azerty', first_name: 'Martin', last_name: 'Dutilleul', phone_number: '06723388 977')
martin.remote_photo_url = "https://avatars0.githubusercontent.com/u/55383792?v=4"
martin.save!

bouba = User.create!(email: 'alex56@gmail.com', password: 'azerty', first_name: 'Bouba', last_name: 'pfrt', phone_number: '0677889977')
bouba.remote_photo_url = "https://avatars2.githubusercontent.com/u/54802639?v=4"
bouba.save!

antoine = User.create!(email: 'duroyon@gmail.fr', password: 'azerty', first_name: 'Antoine', last_name: 'Dubois', phone_number: '06778899 77')
antoine.remote_photo_url = "https://avatars1.githubusercontent.com/u/54395152?v=4"
antoine.save!

joseph = User.create!(email: 'henripfr@gmail.com', password: 'azerty', first_name: 'Joseph', last_name: 'derujh', phone_number: '067788227')
joseph.remote_photo_url = "https://avatars1.githubusercontent.com/u/55735711?v=4"
joseph.save!

anne = User.create!(email: 'bouba@gmail.com', password: 'azerty', first_name: 'Anne', last_name: 'arlou', phone_number: '0677889977')
anne.remote_photo_url = "https://avatars2.githubusercontent.com/u/54837216?v=4"
anne.save!

perinne = User.create!(email: 'sadju@gmail.com', password: 'azerty', first_name: 'Perrine', last_name: 'Massoni', phone_number: '0611189 977')
perinne.remote_photo_url = "https://avatars1.githubusercontent.com/u/54813497?v=4"
perinne.save!

sandrine = User.create!(email: 'sandrine@gmail.com', password: 'azerty', first_name: 'Sandrine', last_name: 'Massoni', phone_number: '06111899 77')
sandrine.remote_photo_url = "https://avatars0.githubusercontent.com/u/7688029?v=4"
sandrine.save!

marie = User.create!(email: 'marie@gmail.com', password: 'azerty', first_name: 'Marie', last_name: 'go', phone_number: '0611189977')
marie.remote_photo_url = "https://avatars1.githubusercontent.com/u/30141649?v=4"
marie.save!

helene = User.create!(email: 'helene@gmail.com', password: 'azerty', first_name: 'Hélène', last_name: 'Massoni', phone_number: '06111 89977')
helene.remote_photo_url = "https://avatars3.githubusercontent.com/u/54664044?v=4"
helene.save!

louis = User.create!(email: 'remi.cordo2@gmail.com', password: 'azerty', first_name: 'Louis', last_name: 'Cordonnier', phone_number: '06889 77942')
louis.remote_photo_url = "https://avatars0.githubusercontent.com/u/17082201?v=4"
louis.save!

marion = User.create!(email: 'remi.cordo3@gmail.com', password: 'azerty', first_name: 'Marion', last_name: 'Cordonnier', phone_number: '0688977942' )
marion.remote_photo_url = "https://avatars1.githubusercontent.com/u/16647400?v=4"
marion.save!

julie = User.create!(email: 'remi.cordo4@gmail.com', password: 'azerty', first_name: 'Julie', last_name: 'Cordonnier', phone_number: '0688977942')
julie.remote_photo_url = "https://avatars2.githubusercontent.com/u/55282448?v=4"
julie.save!

sarah = User.create!(email: 'remi.cordo5@gmail.com', password: 'azerty', first_name: 'Sarah', last_name: 'Cordonnier', phone_number: '0688977942')
sarah.remote_photo_url = "https://avatars3.githubusercontent.com/u/37838192?v=4"
sarah.save!

alex = User.create!(email: 'remi.cordo8@gmail.com', password: 'azerty', first_name: 'Alex', last_name: 'Cordonnier', phone_number: '0688977942')
alex.remote_photo_url = "https://avatars0.githubusercontent.com/u/32016201?v=4"
alex.save!

john = User.create!(email: 'remi.cordo7@gmail.com', password: 'azerty', first_name: 'John', last_name: 'Cordonnier', phone_number: '0688977942')
john.remote_photo_url = "https://avatars3.githubusercontent.com/u/35258797?v=4"
john.save!

david = User.create!(email: 'remi.cordo9@gmail.com', password: 'azerty', first_name: 'David', last_name: 'Cordonnier', phone_number: '0688977942')
david.remote_photo_url = "https://avatars1.githubusercontent.com/u/55805973?v=4"
david.save!

puts "finished"

puts "Creating services"

service_array = Service.all

netflix_premium = Service.create!(name: 'Netflix Premium',  number_of_places: '4',    total_price: '15.99',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'netflix-premium.png')
netflix_standard = Service.create!(name: 'Netflix Standard', number_of_places: '2',    total_price: '10.99',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'netflix-standard.png')
ocs = Service.create!(name: 'OCS',              number_of_places: '4',    total_price: '12',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'ocs.png')
spotify_family = Service.create!(name: 'Spotify family',   number_of_places: '6',    total_price: '14,99',    category: 'musique',     description: 'Des millions de titres à ecouter',              photo: 'spotify.png')
deezer_premium = Service.create!(name: 'Deezer Premium',   number_of_places: '6',    total_price: '14.99',    category: 'musique',     description: 'Des millions de titres à ecouter',              photo: 'deezer.png')
apple_tv_premium = Service.create!(name: 'Apple TV Premium', number_of_places: '4',    total_price: '6,99',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'appletv.png')
amazon_prime_video = Service.create!(name: 'Amazon Prime Video',     number_of_places: '2',    total_price: '4.09',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'amazon-prime-video.png')
youtube_premium = Service.create!(name: 'Youtube Premium',  number_of_places: '6',    total_price: '18',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'youtube.png')
canal_series = Service.create!(name: 'Canal+ Serie',     number_of_places: '2',    total_price: '10',    category: 'vosd',        description: 'Service de VOD en ligne',                      photo: 'canal.png')
apple_music = Service.create!(name: 'Apple music',      number_of_places: '6',    total_price: '15',    category: 'musique',     description: 'Des millions de titres à ecouter',              photo: 'apple.png')
amazon_music = Service.create!(name: 'Amazon Music',     number_of_places: '6',    total_price: '4,09',    category: 'musique',     description: 'Des millions de titres à ecouter',              photo: 'amazon-music.png')
amazon_prime = Service.create!(name: 'Amazon Prime',     number_of_places: '2',    total_price: '4,09',     category: 'ecommerce',  description: 'Livraison express et gratuite',                 photo: 'amazon-prime.png')
cdiscount = Service.create!(name: 'Cdiscount',        number_of_places: '2',    total_price: '2.50',  category: 'ecommerce',  description: 'Livraison express et gratuite',                 photo: 'cdiscount.png')
pack_office = Service.create!(name: 'Pack Office',      number_of_places: '6',    total_price: '8,25',  category: 'logiciel',    description: 'Pack office complet ',                          photo: 'office-365.png')
norton_premium = Service.create!(name: 'Norton Premium',   number_of_places: '10',   total_price: '8,5',   category: 'logiciel',    description: 'Service VPN',                                   photo: 'norton.png')
cyperghost = Service.create!(name: 'CyperGhost',       number_of_places: '6',    total_price: '12',    category: 'logiciel',    description: 'Cryptez vos activités en ligne',                photo: 'cyberghost.png')
zenmate = Service.create!(name: 'ZenMate',          number_of_places: '5',    total_price: '10',    category: 'logiciel',    description: 'Service VPN',                                   photo: 'zenmate.png')
trustzone = Service.create!(name: 'TrustZone',        number_of_places: '2',    total_price: '8',     category: 'logiciel',    description: 'Service de transfert de données ',              photo: 'trustzone.png')
fsecure = Service.create!(name: 'FSecure',          number_of_places: '2',    total_price: '5',     category: 'logiciel',    description: 'Protection de votre ordinateur ',               photo: 'fsecure.png')
mcafee = Service.create!(name: 'McAfee',           number_of_places: '4',    total_price: '7,20',  category: 'logiciel',    description: 'Protection de votre ordinateur ',               photo: 'mcafee.png')
pure_vpn = Service.create!(name: 'Pure VPN',         number_of_places: '4',    total_price: '9,60',  category: 'logiciel',    description: 'Serice VPN',                                    photo: 'purevpn.png')
playstation_plus = Service.create!(name: 'PlayStation Plus', number_of_places: '2',    total_price: '5',     category: 'jeuvideo',  description: 'Jouez aux jeux telechargés',                    photo: 'playstation.png')
xbox_live = Service.create!(name: 'Xbox Live',        number_of_places: '2',    total_price: '5',     category: 'jeuvideo',  description: 'Jouez aux jeux telechargés',                    photo: 'xbox.png')
nintendo_online = Service.create!(name: 'Nintendo Online',  number_of_places: '8',    total_price: '3',     category: 'jeuvideo',  description: 'Profitez du service Nintendo Switch Online',    photo: 'nintendo.png')
googleplay_pass = Service.create!(name: 'GooglePlay Pass',  number_of_places: '5',    total_price: '5',     category: 'jeuvideo',  description: 'Plus de 350 jeux et applications en illimité ', photo: 'google.png')
apple_arcade = Service.create!(name: 'Apple Arcade',     number_of_places: '5',    total_price: '5',     category: 'jeuvideo',  description: 'Plus de 100 jeux en illimité ',                 photo: 'applearcade.png')
blacknut = Service.create!(name: 'BlackNut',         number_of_places: '3',    total_price: '15',    category: 'jeuvideo',  description: 'Accés complet à un catalogue de 360 jeux ',     photo: 'balcknut.png')
utomik = Service.create!(name: 'Utomik',           number_of_places: '3',    total_price: '10',    category: 'jeuvideo',  description: 'De nouveaux jeux chaque semaine',       photo: 'utomik.png')
apple_cloud = Service.create!(name: 'Apple Cloud',      number_of_places: '5',    total_price: '10',    category: 'cloud',       description: '2To d espace de stockage pour vos données',     photo: 'icloud.png')
google_cloud = Service.create!(name: 'Google Cloud',     number_of_places: '5',    total_price: '10',    category: 'cloud',       description: '2To d espace de stockage pour vos données',     photo: 'gcloud.png')
le_parisien = Service.create!(name: 'Le Parisien',      number_of_places: '2',    total_price: '6',     category: 'presse',      description: 'Le journal en version numérique',               photo: 'leparisien.png')
le_figaro = Service.create!(name: 'Le Figaro',        number_of_places: '5',    total_price: '20',    category: 'presse',      description: 'Le journal en version numérique',               photo: 'figaro.png')
liberation = Service.create!(name: 'Liberation',       number_of_places: '2',    total_price: '8',     category: 'presse',      description: 'Le journal en version numérique',               photo: 'liberation.png')
express = Service.create!(name: 'L Express',        number_of_places: '2',    total_price: '8',     category: 'presse',      description: 'Le journal en version numérique',               photo: 'lexpress.png')
izneo = Service.create!(name: 'Izneo',            number_of_places: '6',    total_price: '13',    category: 'presse',      description: 'Lisez comme vous le voulez ',                   photo: 'izneo.png')
xhamster = Service.create!(name: 'Xhamster',            number_of_places: '2',    total_price: '49',    category: 'presse',      description: 'Regardez ce que vous voulez ',                   photo: 'xhamster.png')
puts "finished"




puts "Creating subscriptions"

user_array = User.all

#xhamster
remi_xhamster_sub = Subscription.create!(available_places: '2', identifiant: 'remicelib', password: 'azerty', user: remi, service: xhamster)


#OCS
john_ocs_sub = Subscription.create!(available_places: '3', identifiant: 'johnlebg', password: 'azerty', user: john, service: ocs)
Subscription.create!(available_places: '2', identifiant: 'che', password: 'azerty', user: alex, service: ocs)
Subscription.create!(available_places: '1', identifiant: 'hellobuddy', password: 'azerty', user: julie, service: ocs)
Subscription.create!(available_places: '2', identifiant: 'martinderr', password: 'azerty', user: marie, service: ocs)
Subscription.create!(available_places: '2', identifiant: 'martinderr', password: 'azerty', user: sarah, service: ocs)
Subscription.create!(available_places: '2', identifiant: 'martinderr', password: 'azerty', user: anne, service: ocs)

#Netflix premium
john_netflixpremium_sub =Subscription.create!(available_places: '2', identifiant: 'jupatu', password: 'azertyu', user: john, service: netflix_premium)
david_netflixpremium_sub = Subscription.create!(available_places: '3', identifiant: 'juduq', password: 'azerty', user: david, service: deezer_premium)
louis_netflixpremium_sub = Subscription.create!(available_places: '2', identifiant: 'jupatu', password: 'azertyu', user: louis, service: netflix_premium)
bouba_netflixpremium_sub =Subscription.create!(available_places: '3', identifiant: 'juduq', password: 'azerty', user: helene, service: netflix_premium)
joseph_netflixpremium_sub =Subscription.create!(available_places: '2', identifiant: 'jupatu', password: 'azertyu', user: joseph, service: netflix_premium)
bouba_netflixpremium_sub =Subscription.create!(available_places: '3', identifiant: 'juduq', password: 'azerty', user: bouba, service: netflix_premium)
perinne_netflixpremium_sub =Subscription.create!(available_places: '2', identifiant: 'jupatu', password: 'azertyu', user: perinne, service: netflix_premium)
julie_netflixpremium_sub =Subscription.create!(available_places: '1', identifiant: 'JulieCélibataire', password: 'azerty', user: julie, service: netflix_premium)

#netflix_standard
Subscription.create!(available_places: '2', identifiant: 'perinne', password: 'azertyu', user: perinne, service: netflix_standard)
Subscription.create!(available_places: '3', identifiant: 'juduq', password: 'azerty', user: david, service: netflix_standard)
Subscription.create!(available_places: '2', identifiant: 'louis', password: 'azertyu', user: louis, service: netflix_standard)
Subscription.create!(available_places: '3', identifiant: 'helenedu59', password: 'azerty', user: helene, service: netflix_standard)
Subscription.create!(available_places: '2', identifiant: 'jupatu', password: 'azertyu', user: joseph, service: netflix_standard)
Subscription.create!(available_places: '3', identifiant: 'coco', password: 'azerty', user: bouba, service: netflix_standard)
Subscription.create!(available_places: '2', identifiant: 'protoz', password: 'azertyu', user: perinne, service: netflix_standard)
Subscription.create!(available_places: '3', identifiant: 'julie', password: 'azerty', user: julie, service: netflix_standard)


#Spotify_family
Subscription.create!(available_places: '2', identifiant: 'remeco', password: 'azerty', user: david, service: spotify_family)
Subscription.create!(available_places: '3', identifiant: 'remeco', password: 'azerty', user: john, service: spotify_family)
Subscription.create!(available_places: '2', identifiant: 'remeco', password: 'azerty', user: alex, service: spotify_family)
Subscription.create!(available_places: '1', identifiant: 'remeco', password: 'azerty', user: sarah, service: spotify_family)


#apple_tv
Subscription.create!(available_places: '1', identifiant: 'patricia', password: 'azerty', user: julie, service: spotify_family)
Subscription.create!(available_places: '2', identifiant: 'patricia', password: 'azerty', user: marion, service: spotify_family)
Subscription.create!(available_places: '2', identifiant: 'patricia', password: 'azerty', user: louis, service: spotify_family)
Subscription.create!(available_places: '1', identifiant: 'patricia', password: 'azerty', user: helene, service: spotify_family)
Subscription.create!(available_places: '2', identifiant: 'patricia', password: 'azerty', user: marie, service: spotify_family)
Subscription.create!(available_places: '1', identifiant: 'patricia', password: 'azerty', user: sandrine, service: spotify_family)

#divers
Subscription.create!(available_places: '2', identifiant: 'remico', password: 'azerty', user: perinne, service: spotify_family)
Subscription.create!(available_places: '1', identifiant: 'alaindelong', password: 'azerty', user: anne, service: netflix_standard)
Subscription.create!(available_places: '1', identifiant: 'alicedelice', password: 'azerty', user: joseph, service: netflix_standard)
Subscription.create!(available_places: '1', identifiant: 'jakiecadillac', password: 'azerty', user: bouba, service: netflix_standard)
subscription_patrick = Subscription.create!(available_places: '3', identifiant: 'patrick', password: 'azerty', user: martin, service: netflix_premium)
Subscription.create!(available_places: '3', identifiant: 'jeanjean', password: 'azerty', user: antoine, service: apple_tv_premium)
Subscription.create!(available_places: '2', identifiant: 'coco', password: 'azerty', user: olivier, service: deezer_premium)
Subscription.create!(available_places: '2', identifiant: 'mika', password: 'azerty', user: david, service: netflix_premium)
Subscription.create!(available_places: '1', identifiant: 'louise', password: 'azerty', user: sandrine, service: netflix_premium)
Subscription.create!(available_places: '2', identifiant: 'patricia', password: 'azerty', user: martin, service: spotify_family)
Subscription.create!(available_places: '2', identifiant: 'daniel', password: 'azerty', user: bouba, service: deezer_premium)





puts "Creating cotisations"

user_array = User.all

#Cotisation sur l'OCS de John
ocs_marie_cotis = Cotisation.create!(start_date: Date.today, user: marie, subscription: john_ocs_sub)
ocs_sarah_cotis = Cotisation.create!(start_date: Date.today, user: sarah, subscription: john_ocs_sub)

#Cotisation sur Netflix premium
netflix_antoine_cotis = Cotisation.create!(start_date: Date.today, user: antoine, subscription: julie_netflixpremium_sub)
netflix_marie_cotis = Cotisation.create!(start_date: Date.today, user: marie, subscription: julie_netflixpremium_sub)
netflix_sarah_cotis = Cotisation.create!(start_date: Date.today, user: sarah, subscription: perinne_netflixpremium_sub)
netflix_sandrine_cotis = Cotisation.create!(start_date: Date.today, user: sandrine, subscription: bouba_netflixpremium_sub)
netflix_anne_cotis = Cotisation.create!(start_date: Date.today, user: anne, subscription: bouba_netflixpremium_sub)

puts "finished"


puts "Creating Reviews"

#Review sur la sub OCS de John
Review.create!(cotisation: ocs_marie_cotis, content: "John est le plus beau", rating: 5)
Review.create!(cotisation: ocs_sarah_cotis, content: "John m'a exclu de son partage sans raison", rating: 1)

#Review sur les sub Netflix Premium
Review.create!(cotisation: netflix_antoine_cotis, content: "Julie est très sympa", rating: 5)
Review.create!(cotisation: netflix_marie_cotis, content: "J'adore Netflix !", rating: 5)
Review.create!(cotisation: netflix_sandrine_cotis, content: "Super rapeur, super shareur !", rating: 5)
Review.create!(cotisation: netflix_anne_cotis, content: "Rien à dire !", rating: 5)
Review.create!(cotisation: netflix_sarah_cotis, content: "Très déçu !", rating: 2)












