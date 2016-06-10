defmodule Alice.Handlers.TielursHeartRate do
  @moduledoc """
  Retrieve Tielur's heart rate
  """

  use Alice.Router
  alias TielursHeartRate.Formatter

  route ~r/(tielur|tielurs|tielur's) (heart|\:heart\:|[❤️💛💚💙💜❣️💕💓💗💖💘💝💟💔])/iu, :heart_rate

  def heart_rate(conn) do
    TielursHeartRate.measure
    |> List.first
    |> Formatter.format_message
    |> reply(conn)
  end

end