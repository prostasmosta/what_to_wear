require_relative 'lib/clothing_collection'

clothing_collection = ClothingCollection.from_dir("#{__dir__}/data")

puts 'Сколько градусов за окном? (можно с минусом)'
degree = $stdin.gets.to_i

suitable_garments = clothing_collection.clothes_for_weather(degree)

if suitable_garments.empty?
  puts 'У вас нет подходящих вещей'
else
  puts 'Предлагаем сегодня надеть:'
  puts suitable_garments
end
