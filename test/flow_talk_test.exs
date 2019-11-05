defmodule FlowTalkTest do
  use ExUnit.Case
  doctest FlowTalk

  test "greets the world" do
    assert FlowTalk.hello() == :world
  end
end
