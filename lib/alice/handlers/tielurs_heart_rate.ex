defmodule Alice.Handlers.TielursHeartRate do
  @moduledoc """
  Retrieve Tielur's heart rate
  """

  use Alice.Router
  use Timex

  route ~r/(tielur|tielurs|tielur's) (heart|\:heart\:|[❤️💛💚💙💜❣️💕💓💗💖💘💝💟💔])/iu, :heart_rate

  @doc "`Tielur's heart rate` - Returns Tielur's latest heart rate"
  def heart_rate(conn, timeout \\ 1000) do
    timeout
    |> TielursHeartRate.measure
    |> handle_measurement(conn)
  end

  defp handle_measurement({:ok, %{body: body}}, conn) do
    body
    |> Enum.reverse
    |> hd
    |> format_message
    |> reply(conn)
  end
  defp handle_measurement({:error, _}, conn) do
    reply("Tielur is too cheap to pay $7 for heroku, so I have to wait for his rails server to respond...", conn)
    heart_rate(30000, conn)
  end

  defp format_message(%{time: time, value: value}) do
    [hr, min, sec] = time |> String.split(":") |> Enum.map(&String.to_integer/1)
    time = DateTime.local |> DateTime.set(hour: hr, minute: min, second: sec) |> Timex.from_now
    "Tielur's heart rate was #{value}BPM about #{time}"
  end
end
