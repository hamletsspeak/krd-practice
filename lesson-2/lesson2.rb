def greeting
  puts 'Input name: '
  first_name = gets.chomp
  puts 'Input female'
  female = gets.chomp
  puts 'Input age: '
  age = gets.chomp.to_i

  if age < 18
    "Hi, #{first_name} #{female}"
  elsif age > 18
    "Hi, #{first_name} #{female}, go play dota"
  else
    "Hi, #{first_name} #{female}, go play cs2"
  end
end

puts greeting