defmodule Alice.Handlers.TielursHeartRate do
  @moduledoc """
  Retrieve Tielur's heart rate
  """

  use Alice.Router
  use Timex

  route ~r/(tielur|tielurs|tielur's) (heart|\:heart\:|[❤️💛💚💙💜❣️💕💓💗💖💘💝💟💔])/iu, :heart_rate

  def heart_rate(conn) do
    TielursHeartRate.measure
    |> List.first
    |> format_message
    |> reply(conn)
  end

  def format_message(measurement) do
    split_time = String.split(measurement.time, ":")
    hours = String.to_integer(Enum.at(split_time, 0))
    minutes = String.to_integer(Enum.at(split_time, 1))
    seconds = String.to_integer(Enum.at(split_time, 2))
    heart_rate_time = DateTime.set(DateTime.local, hour: hours, minute: minutes, second: seconds)
    "Tielur's heart rate was #{measurement.value}BPM about #{Timex.from_now(heart_rate_time)}"
  end

end
