defmodule CounterApp.CounterServer do
  use GenServer

  # Client | Start GenServer
  def start_link(_args) do # def start_link(_args) do
    # IO.puts("start_link")
    initial_value = 0
    GenServer.start_link(__MODULE__, initial_value, name: :counter)
  end


  # Server (Callbacks)
  @impl true
  def init(initial_value) do
    IO.puts("genserver!")
    IO.puts("initial value #{inspect(initial_value)}")
    {:ok, initial_value}
  end

  @impl true
  def handle_call(:increment, _from ,count) do
    new_count = max(count + 1, 0)
    Phoenix.PubSub.broadcast(CounterApp.PubSub, "value_updates", {:new_count, new_count})
    {:reply, new_count, new_count}
  end

  @impl true
  def handle_call(:decrement, _from, count) do
    new_count = max(count - 1, 0)
    Phoenix.PubSub.broadcast(CounterApp.PubSub, "value_updates", {:new_count, new_count})
    {:reply, new_count, new_count}
  end

  @impl true
  def handle_call(:reset, _from, _count) do
    Phoenix.PubSub.broadcast(CounterApp.PubSub, "value_updates", {:new_count, 0})
    {:reply, 0, 0}
  end

  @impl true
  def handle_call(:get, _from, count) do
    IO.puts("get #{inspect(count)}")
    {:reply, count, count}
  end
end
v
