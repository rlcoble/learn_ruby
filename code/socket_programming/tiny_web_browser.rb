require 'socket'
require 'json'
 
host = 'localhost'     		# The web server
port = 2000                 # Default HTTP port
path = "/index.html"		# The file we want 

print "What type of request whould you like to send? "
selection = gets.chomp.upcase
if selection=="POST"
	print "Name: "
	name = gets.chomp
	print "Email: "
	email = gets.chomp

	viking = {viking: {name: name, email: email}}

	request = "POST /index.html HTTP/1.0"
	from = "From: #{email}"
	length = "Content-Length: #{viking.to_json.bytesize}\r\n\r\n"
	
	socket = TCPSocket.open(host,port)  # Connect to server
	socket.puts(request)               	# Send request
	socket.puts(from)
	socket.puts(length)
	socket.puts(viking.to_json)
else
	# This is the HTTP request we want to send 
	request = "GET #{path} HTTP/1.0\r\n\r\n"
	
	socket = TCPSocket.open(host,port)  # Connect to server
	socket.puts(request)               	# Send request
end


response = socket.read         		# Read complete response
# Split response at first blank line into headers and body
headers,body,close = response.split("\r\n\r\n", 3) 
puts body                          # And display it