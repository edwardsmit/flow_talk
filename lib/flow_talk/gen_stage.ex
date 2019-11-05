defmodule FlowTalk.GenStage.Producer do
  use GenStage

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(_demand, counter) when counter > 5000 do
    {:stop, :end_of_the_road, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    events = Enum.to_list(counter..(counter + demand - 1))
    {:noreply, events, counter + demand}
  end
end

defmodule FlowTalk.GenStage.Consumer do
  use GenStage

  def init(:ok) do
    {:consumer, :the_state_does_not_matter}
  end

  def handle_events(events, _from, state) do
    Process.sleep(1000)
    IO.inspect(events)
    {:noreply, [], state}
  end
end

defmodule FlowTalk.GenStage do
  alias FlowTalk.GenStage.{Consumer, Producer}

  def run do
    {:ok, counter} = GenStage.start_link(Producer, 0)
    {:ok, printer} = GenStage.start_link(Consumer, :ok)

    GenStage.sync_subscribe(printer, to: counter)
  end
end
