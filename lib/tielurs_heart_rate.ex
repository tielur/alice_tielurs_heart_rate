defmodule TielursHeartRate do
  alias Alice.Conn

  def measure(numberOfHeartRates \\ 1) do
    http.get!("", [], [timeout: 30000, recv_timeout: 30000]).body
    |> Enum.reverse
    |> Enum.take(numberOfHeartRates)
  end

  defp http do
    case Mix.env do
      :test -> TielursHeartRate.TestClient
      _     -> TielursHeartRate.Client
    end
  end

end