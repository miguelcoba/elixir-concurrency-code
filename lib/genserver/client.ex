defmodule GenServer.Client do
	def start do
		loop
	end

	def loop do
		counter = GenServer.Server.next
		IO.puts "Got #{counter}"
		loop
	end
end