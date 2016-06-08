defmodule TielursHeartRate.TestClient do
  @moduledoc """
  This is an http client stub used in tests
  """

  @doc """
  Stubs the `get!` function for testing
  """
  def get!(url) do
    send self, {:get, url: url}
    %{body: [
       %{time: "00:00:00", value: 96}, 
       %{time: "18:18:00", value: 87}, 
       %{time: "18:23:00", value: 91}
    ]}
  end
end