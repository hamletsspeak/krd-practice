
# Функция для чтения файла и возврата массива строк
def read_file(filename)
  File.readlines(filename).map(&:chomp)
end

# Функция для записи данных в файл
def write_to_file(filename, data)
  File.open(filename, 'w') do |file|
    data.each do |line|
      file.puts(line)
    end
  end
end

# Читаем исходный файл
input_filename = '2.txt'
students = read_file(input_filename)

# Инициализируем массив для хранения результатов
results = []

loop do
  # Запрашиваем возраст у пользователя
  puts 'Введите возраст (-1 для завершения):'
  age_input = gets.chomp.to_i

  # Проверяем, нужно ли завершить программу
  break if age_input == -1

  # Ищем студентов с указанным возрастом
  matching_students = students.select { |student| student.split.last.to_i == age_input }

  # Добавляем найденных студентов в результаты и удаляем из исходного массива
  matching_students.each do |student|
    results << student
    students.delete(student)
  end

  # Проверяем, остались ли еще студенты в исходном массиве
  break if students.empty?
end

# Записываем результаты в файл
result_filename = 'result.txt'
write_to_file(result_filename, results)

# Выводим сообщение о завершении программы
puts 'Программа завершена. Результаты записаны в файл result.txt'
