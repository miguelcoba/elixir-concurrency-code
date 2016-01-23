defmodule GenServer.Server do
	use GenServer

	def start do
		GenServer.start_link(GenServer.Server, 0, name: {:global, :counter})
	end

	def next do
		GenServer.call({:global, :counter}, :next)
	end

	# Implementation
	def handle_call(:next, _from, counter) do
		{:reply, counter, counter + 1}
	end
end