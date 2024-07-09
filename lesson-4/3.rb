# Константа для стартового баланса
START_BALANCE = 100.0

# Функция для чтения баланса из файла
def read_balance(filename)
  if File.exist?(filename)
    File.read(filename).to_f
  else
    START_BALANCE
  end
end

# Функция для записи баланса в файл
def write_balance(filename, balance)
  File.open(filename, 'w') do |file|
    file.puts(balance)
  end
end

# Функция для обработки депозита
def deposit(balance)
  puts 'Введите сумму депозита:'
  amount = gets.chomp.to_f
  if amount > 0
    balance += amount
    puts "Новый баланс: #{balance}"
  else
    puts 'Ошибка: сумма депозита должна быть больше 0.'
  end
  balance
end

# Функция для обработки вывода средств
def withdraw(balance)
  puts 'Введите сумму для снятия:'
  amount = gets.chomp.to_f
  if amount > 0 && amount <= balance
    balance -= amount
    puts "Новый баланс: #{balance}"
  else
    puts 'Ошибка: сумма должна быть больше 0 и не превышать текущий баланс.'
  end
  balance
end

# Функция для проверки баланса
def check_balance(balance)
  puts "Текущий баланс: #{balance}"
end

# Главная функция программы
def main
  filename = 'balance.txt'
  balance = read_balance(filename)

  loop do
    puts 'Введите команду (D - deposit, W - withdraw, B - balance, Q - quit):'
    command = gets.chomp.upcase

    case command
    when 'D'
      balance = deposit(balance)
    when 'W'
      balance = withdraw(balance)
    when 'B'
      check_balance(balance)
    when 'Q'
      write_balance(filename, balance)
      puts 'Выход из программы. Баланс сохранен.'
      break
    else
      puts 'Ошибка: неверная команда. Пожалуйста, используйте D, W, B или Q.'
    end
  end
end

# Запуск программы
main
