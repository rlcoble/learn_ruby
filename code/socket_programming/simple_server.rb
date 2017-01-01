require 'socket'				# Get sockets from stdlib
require 'json'

server = TCPServer.open(2000)	# Socket to listen on port 2000
loop{ 							# Servers run forever
	client = server.accept		# Wait for a client to connect
	puts client
	request = client.gets
	puts request
	type,path,protocol = request.split(" ", 3)
	if (type=="GET" && path=="/index.html")
		client.puts("HTTP/1.0 200 OK")
		client.puts("Content-Length: #{File.size("index.html")}\r\n\r\n")
		f = File.open("index.html")
		lines = f.readlines
		client.puts("#{lines.join}\r\n\r\n")
	elsif type == "POST"
		email = client.gets 
		length = client.gets
		client.gets
		viking = client.gets
		params = JSON.parse(viking)
		response = File.read("thanks.html")
		user_data = "<li>name: #{params['viking']['name']}</li><li>e-mail: #{params['viking']['email']}</li>"
		client.puts("HTTP/1.0 200 OK\r\n\r\n")
		client.puts "#{response.gsub('<%= yield %>', user_data)}\r\n\r\n"
	else
		client.puts("HTTP/1.0 404 Not Found\r\n\r\n")
	end
	client.puts "Closing the connection. Bye!"
	client.close				# Disconnect from the client
}