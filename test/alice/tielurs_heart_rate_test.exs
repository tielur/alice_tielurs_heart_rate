defmodule TielursHeartRateTest do
  use ExUnit.Case, async: true

  test "process_url callback adds the domain to the path" do
    assert TielursHeartRate.measure == [%{time: "18:23:00", value: 91}]
  end

  test "stuff" do
    measurement = TielursHeartRate.measure
    |> "Tielur's last recorded heart rate was: #{measurement.value}"
    |> String.strip
  end

end