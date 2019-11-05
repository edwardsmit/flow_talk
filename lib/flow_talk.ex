defmodule FlowTalk do
  @moduledoc """
  Code-examples from Jose's talk about Flow
  """

  @doc """
  genstage

  ## Examples

      iex> FlowTalk.genstage()
      

  """
  defdelegate genstage, to: FlowTalk.GenStage, as: :run
end
