defmodule Client do
	def start do
		counter_pid = :global.whereis_name(:counter)
		loop(counter_pid)
	end

	def loop(counter_pid) do
		send counter_pid, {:next, self}
		receive do
			{:ok, counter} -> IO.puts "Got #{counter}"
		after
			1000 -> "No answer :("
		end
		loop(counter_pid)
	end
end
