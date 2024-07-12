require "socket"
require "./zad"

server = TCPServer.open('0.0.0.0', 8000)

while connection = server.accept
  request = connection.gets

  method, full_path, protocol = request.split(' ')

  path, params = full_path.split("?")

  puts method, path, protocol, params
  response = case path
             when "/"
               balance = CashMachine.init
               "Input method:\nDeposit (d)\nWithdraw (w)\nBalance (b)\nQuit (q)\n\n"
             when "/d"
               'Input deposit sum'
               cash = params.to_f
               CashMachine.deposit(cash)
             when "/w"
               'Input withdraw sum'
               cash = params.to_f
               CashMachine.withdraw(cash)
             when "/b"
               CashMachine.tekBalance
             else
               "Incorrect method!"
             end

  status = response == "Incorrect method!" ? "404" : "200"

  connection.print "HTTP/1.1 #{status}\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print response

  connection.close
end