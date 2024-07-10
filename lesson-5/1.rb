class CashMachine
  START_BALANCE = 100.0

  def initialize(filename)
    @filename = filename
    @balance = read_balance
  end

  def read_balance
    if File.exist?(@filename)
      File.read(@filename).to_f
    else
      START_BALANCE
    end
  end

  def write_balance
    File.open(@filename, 'w') do |file|
      file.puts(@balance)
    end
  end

  def deposit
    puts 'Введите сумму депозита:'
    amount = gets.chomp.to_f
    if amount > 0
      @balance += amount
      puts "Новый баланс: #{@balance}"
    else
      puts 'Ошибка: сумма депозита должна быть больше 0.'
    end
  end

  def withdraw
    puts 'Введите сумму для снятия:'
    amount = gets.chomp.to_f
    if amount > 0 && amount <= @balance
      @balance -= amount
      puts "Новый баланс: #{@balance}"
    else
      puts 'Ошибка: сумма должна быть больше 0 и не превышать текущий баланс.'
    end
  end

  def check_balance
    puts "Текущий баланс: #{@balance}"
  end

  def run
    loop do
      puts 'Введите команду (D - deposit, W - withdraw, B - balance, Q - quit):'
      command = gets.chomp.upcase

      case command
      when 'D'
        deposit
      when 'W'
        withdraw
      when 'B'
        check_balance
      when 'Q'
        write_balance
        puts 'Выход из программы. Баланс сохранен.'
        break
      else
        puts 'Ошибка: неверная команда. Пожалуйста, используйте D, W, B или Q.'
      end
    end
  end
end

# Инициализация и запуск программы
def init
  atm = CashMachine.new('balance.txt')
  atm.run
end

# Запуск программы
init
