defmodule TielursHeartRate do
  alias Alice.Conn
  use Timex

  def measure(numberOfHeartRates \\ 1) do
    http.get!("").body
    |> Enum.reverse
    |> Enum.take(numberOfHeartRates)
  end

  def format_message(measurement) do
    split_time = String.split(measurement.time, ":")
    hours = String.to_integer(Enum.at(split_time, 0))
    minutes = String.to_integer(Enum.at(split_time, 1))
    seconds = String.to_integer(Enum.at(split_time, 2))
    heart_rate_time = DateTime.set(DateTime.local, hour: hours, minute: minutes, second: seconds)
    "Tielur's heart rate was #{measurement.value}BPM about #{Timex.from_now(heart_rate_time)}"
  end

  defp http do
    case Mix.env do
      :test -> TielursHeartRate.TestClient
      _     -> TielursHeartRate.Client
    end
  end

end