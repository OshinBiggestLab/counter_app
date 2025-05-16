# TodoApp

GenServer project
![TodoApp](design/desktop-design-dark.jpg)


```
defmodule Counter.Server do
  use GenServer

  def start_link(initial) do
    GenServer.start_link(__MODULE__, initial, name: __MODULE__)
  end
end
```

GenServer.start_link(
**MODULE**, # (1) Your GenServer module (e.g. Counter.Server)
initial, # (2) The starting state passed to init/1
name: **MODULE** # (3) Register the server using your module name
)

First **MODULE** says:
“I want to start a GenServer using my own module’s logic.”
Second **MODULE** says:
“Register me with this name so I can be called globally.”

