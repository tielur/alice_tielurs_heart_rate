defmodule TielursHeartRate do
  def measure(timeout \\ 1000) do
    http.get("", %{}, timeout: timeout, recv_timeout: timeout)
  end

  defp http do
    case Mix.env do
      :test -> TielursHeartRate.TestClient
      _     -> TielursHeartRate.Client
    end
  end
end
