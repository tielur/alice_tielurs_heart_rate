defmodule TielursHeartRate do
  alias Alice.Conn

  def measure(timeout \\ 3000) do
    http.get("", %{}, [timeout: timeout, recv_timeout: timeout])
  end

  defp http do
    case Mix.env do
      :test -> TielursHeartRate.TestClient
      _     -> TielursHeartRate.Client
    end
  end

end