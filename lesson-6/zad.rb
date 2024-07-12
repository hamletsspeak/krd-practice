class CashMachine
  def self.init
    const = 100.0

    if File.exist?("balance.txt")
      file = File.open("balance.txt", "r")
      balance = file.read
      balance = balance.to_f
    else
      file = File.new("balance.txt", "w")
      file.puts const
      balance = const
    end
    file.close
    @balance = balance
  end

  def self.deposit(cash)
    cash = cash.to_f
    puts 'Input deposit sum: '
    if cash <= 0
      return "Input incorrect sum.\nSum must be more 0!\n\n"
    end
    @balance = @balance + cash
    puts "Added sum #{cash}"
    puts "Balance now #{@balance}\n\n"
    file = File.open("balance.txt", "w")
    file.puts @balance
    file.close
    return @balance
  end

  def self.withdraw(cash)
    puts 'Input withdraw sum: '
    cash = cash.to_f
    if cash <= 0 || cash > @balance
      return "Input incorrect sum.\nSum must be more 0 and lower sum in cashmachine!\n\n"
    end
    @balance = @balance - cash
    puts "Withdraw sum #{cash}"
    puts "Balance now #{@balance}\n\n"
    file = File.open("balance.txt", "w")
    file.puts @balance
    file.close
    return @balance
  end

  def self.tekBalance
    "Balance #{@balance}\n\n"
  end
end