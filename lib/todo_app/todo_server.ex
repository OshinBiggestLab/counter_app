defmodule TodoApp.TodoServer do
  use GenServer

  # Client | Start GenServer
  def start_link(_args) do
    GenServer.start_link(__MODULE__, :counter, name: __MODULE__)
  end


  # Server (Callbacks)
  @impl true
  def init(:counter) do
    IO.puts("genserver!")
    {:ok, 0}
  end
end
