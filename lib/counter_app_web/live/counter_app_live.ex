defmodule CounterAppWeb.CounterAppLive do
  use CounterAppWeb, :live_view

  def mount(_params, _session, socket) do
    count = GenServer.call(:counter, :get)

    :ok = Phoenix.PubSub.subscribe(CounterApp.PubSub, "value_updates")
    {:ok, assign(socket, count: count)}
  end

  def handle_info({:new_count, count}, socket) do
    IO.puts("new count #{inspect(count)}")
    {:noreply, assign(socket, count: count)}
  end



  def handle_event("increment", _params, socket) do
    # :counter.increment()
    _new_count = GenServer.call(:counter, :increment)
    {:noreply, socket}
  end

  def handle_event("decrement", _params, socket) do
    _new_count = GenServer.call(:counter, :decrement)
    {:noreply, socket}
  end

  def handle_event("reset", _params, socket) do
    _new_count = GenServer.call(:counter, :reset)
    {:noreply, socket}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
      <main class="bg-sky-100 flex flex-col gap-y-8 h-screen items-center pt-40">
        <header class="flex flex-col items-center mb-20">
        <h1 class="font-bold text-4xl">COUNTER APP</h1>
        <p>For GenServer testing</p>
        </header>
        <section class="flex flex-col items-center gap-y-10">
          <div class="flex gap-x-10 text-3xl text-white">
           <button class="rounded-full w-10 h-10 border border-black shadow-lg bg-slate-900" phx-click="decrement"> - </button>
            <span class="text-black"><%= @count %></span>
           <button class="rounded-full w-10 h-10 border border-black shadow-lg bg-slate-900" phx-click="increment"> + </button>
          </div>
          <button class="text-lg" phx-click="reset">Reset</button>
        </section>
      </main>
    """
  end
end
