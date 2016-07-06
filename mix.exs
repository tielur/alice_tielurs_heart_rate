defmodule AliceTielursHeartRate.Mixfile do
  use Mix.Project

  def project do
    [app: :alice_tielurs_heart_rate,
     version: "0.0.6",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A handler for the Alice Slack bot. Allows Alice to check Tielur's heart rate",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:tzdata]]
  end

  defp deps do
    [
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:httpoison, "~> 0.8"},
      {:timex, "~> 2.1"},
      {:alice, "~> 0.3"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Tyler Clemens"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/tielur/alice_tielurs_heart_rate"}]
  end
end
