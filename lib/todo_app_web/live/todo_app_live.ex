defmodule TodoAppWeb.TodoAppLive do
  use TodoAppWeb, :live_view

  def mount(_params, _session, socket) do
    count = TodoApp.TodoServer.get()
    IO.puts("count on mount #{inspect(count)}")
    {:ok, assign(socket, count: count)}
  end

  def handle_event("increment", _params, socket) do
    TodoApp.TodoServer.increment()
    count = TodoApp.TodoServer.get()
    IO.puts("count on increment #{inspect(count)}")
    {:noreply, assign(socket, count: count)}
  end

  def handle_event("decrement", _params, socket) do
    TodoApp.TodoServer.decrement()
    count = TodoApp.TodoServer.get()
    IO.puts("count on decrement #{inspect(count)}")
    {:noreply, assign(socket, count: count)}
  end

  def handle_event("reset", _params, socket) do
    TodoApp.TodoServer.reset()
    count = TodoApp.TodoServer.get()
    IO.puts("count on reset #{inspect(count)}")
    {:noreply, assign(socket, count: count)}
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
