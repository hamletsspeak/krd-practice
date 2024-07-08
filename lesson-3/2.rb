def get_number_of_pokemons
  puts "Сколько покемонов вы хотите добавить?"
  gets.chomp.to_i
end

def get_pokemon_details
  puts "Введите имя покемона:"
  name = gets.chomp
  puts "Введите цвет покемона:"
  color = gets.chomp
  { name: name, color: color }
end

def collect_pokemons(number_of_pokemons)
  pokemons = []
  number_of_pokemons.times do
    pokemons << get_pokemon_details
  end
  pokemons
end

def display_pokemons(pokemons)
  puts "Массив покемонов:"
  pokemons.each do |pokemon|
    puts "Имя: #{pokemon[:name]}, Цвет: #{pokemon[:color]}"
  end
end

def main
  number_of_pokemons = get_number_of_pokemons
  pokemons = collect_pokemons(number_of_pokemons)
  display_pokemons(pokemons)
end

main
