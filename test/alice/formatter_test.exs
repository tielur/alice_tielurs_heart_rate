defmodule TielursHeartRate.FormatterTest do
  use ExUnit.Case, async: true
  use Timex
  alias TielursHeartRate.Formatter

  test "measurement_time returns today's date but with the passed in time" do
    measurement_time = Formatter.measurement_time("21:40:00")
    test_time = DateTime.set(DateTime.local, hour: 21, minute: 40, second: 00)
    assert Timex.compare(measurement_time, test_time) == 0
  end

  test "format_message returns heart rate with relative time" do
    assert Formatter.format_message(%{time: "21:40:01", value: 95}) == "Tielur's heart rate was 95BPM about"
  end

end