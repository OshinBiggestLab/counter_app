defmodule TodoAppWeb.TodoAppLive do
  use TodoAppWeb, :live_view

  def render(assigns) do
    ~H"""
      <main class="bg-sky-100 flex flex-col gap-y-8 h-screen items-center pt-40">
        <header class="flex flex-col items-center mb-20">
        <h1 class="font-bold text-4xl">COUNTER APP</h1>
        <p>For GenServer testing</p>
        </header>
        <section class="flex flex-col items-center gap-y-10">
          <div class="flex gap-x-10 text-3xl text-white">
           <button class="rounded-full w-10 h-10 border border-black shadow-lg bg-slate-900"> - </button>
            <span class="text-black">0</span>
           <button class="rounded-full w-10 h-10 border border-black shadow-lg bg-slate-900"> + </button>
          </div>
          <button class="text-lg">Reset</button>
        </section>
      </main>
    """
  end
end
