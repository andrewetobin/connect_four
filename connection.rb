# Library that contains TCPServer
require 'socket'
require './lib/game'
game = Game.new

# Create a new instance of TCPServer on Port 9292
server = TCPServer.new(9292)

loop do
  # Wait for a Request
  # When a request comes in, save the connection to a variable
  puts 'Waiting for Request...'
  connection = server.accept

  # Read the request line by line until we have read every line
  puts "Got this Request:"
  request_lines = []
  line = connection.gets.chomp
  while !line.empty?
    request_lines << line
    line = connection.gets.chomp
  end

  # Print out the Request
  puts request_lines
  game.welcome

  # Send the Response
  connection.puts response

  # close the connection
  connection.close
end
