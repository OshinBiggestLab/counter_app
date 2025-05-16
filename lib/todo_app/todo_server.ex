defmodule TodoApp.TodoServer do
  use GenServer

  # Client | Start GenServer
  def start_link(initial_value \\ 0)
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  def increment do
    GenServer.cast(__MODULE__, :increment)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end


  # Server (Callbacks)
  @impl true
  def init(initial_value) do
    IO.puts("genserver!")
    {:ok, initial_value}
  end

  @impl true
  def handle_cast(:increment, count) do
    {:noreply, count + 1}
  end

  @impl true
  def handle_call(:get, _from, count) do
    {:reply, count, count}
  end
end
