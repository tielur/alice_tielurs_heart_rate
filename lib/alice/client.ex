defmodule TielursHeartRate.Client do
  @moduledoc """
  This is a client to access the tielurs-heart-rate json api over http
  See documentation for HTTPoison.Base for more information
  """
  use HTTPoison.Base

  @expected_fields ~w(
    time value
  )

  @doc "Callback for HTTPoison"
  def process_url(url), do: "tielurs-heart-rate.herokuapp.com" <> url

  @doc "Callback for HTTPoison"
  def process_response_body(body) do
    body
    |> Poison.decode!
    |> get_in(["activities-heart-intraday", "dataset"])
    |> Enum.map(&atomize_keys/1)
  end

  def atomize_keys(data) do
    data
    |> Map.take(@expected_fields)
    |> Stream.map(fn({k, v}) -> {String.to_atom(k), v} end)
    |> Enum.into(%{})
  end
end
