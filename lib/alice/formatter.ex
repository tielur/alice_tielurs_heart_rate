defmodule TielursHeartRate.Formatter do
  use Timex

  def format_message(%{time: time, value: value}) do
    formatted_time = time |> measurement_time |> Timex.from_now
    "Tielur's heart rate was #{value}BPM about #{formatted_time}"
  end

  def measurement_time(time) do
    [hr, min, sec] = time |> String.split(":") |> Enum.map(&String.to_integer/1)
    DateTime.set(DateTime.local, hour: hr, minute: min, second: sec)
  end

end