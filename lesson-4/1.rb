# Написать набор методов для работы с файлом
# index - выводит все строки
# find(id) - находит конкретную строку и выводит ее
# where(pattern) - находит все строки с указанным паттерном
# update(id, text) - обновляет конкретную строку файла
# delete(id) - удаляет строку
# create(name) - добавляет строку в конец файла

TEST_FILE = 't.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(TEST_FILE) {|actor| puts actor}
end

def find(id)
  File.foreach(TEST_FILE).with_index do |actor, index|
    puts actor if id==index+1
  end
end

def where(pattern)
  file = File.open("t.txt")
  file_data = file.read.split("\n")
  File.foreach("t.txt").with_index do |actor, index|
    if actor.include?(pattern)
      puts file_data[index]
    end
  end
end

def update(id, name)
  file = File.open(BUFFER, 'w')
  File.foreach(TEST_FILE).with_index do |actor, index|
    file.puts(id == index+1 ? name : actor)
  end
  file.close
  File.write(TEST_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  index
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(TEST_FILE).with_index do |actor, index|
    file.puts actor if id != index+1
  end
  file.close
  File.write(TEST_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  index
end

def create(name)
  file = File.open(BUFFER, 'w')
  File.foreach(TEST_FILE).with_index do |actor, index|
    file.puts actor
  end
  File.foreach(TEST_FILE).with_index do |actor, index|
    file.puts name if TEST_FILE.size-3 == index+1
  end
  file.close
  File.write(TEST_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  index
end

index
puts 'Введите номер строки '
id = gets.to_i
find(id)

puts 'Введите слово для поиска совпадений '
pattern = gets.to_s
where(pattern)

puts 'Введите номер строки и слово для обновления '
id = gets.to_i
name = gets.to_s
update(id, name)

puts 'Введите номер строки для удаления '
id = gets.to_i
delete(id)

puts 'Введите слово для добавления в конец '
name = gets.to_s
create(name)