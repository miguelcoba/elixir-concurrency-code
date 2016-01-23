defmodule Server do
	def start do
		pid = spawn(Server, :loop, [0])
		:global.register_name(:counter, pid)
	end

	def loop(counter) do
		receive do
			{:next, sender} -> send sender, {:ok, counter}
			loop(counter + 1)
		after
			2000 -> IO.puts "Just here, waiting..."
			loop(counter)
		end
	end
end