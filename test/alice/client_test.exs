defmodule TielursHeartRate.ClientTest do
  use ExUnit.Case, async: true
  alias TielursHeartRate.Client

  test "process_url callback adds the domain to the path" do
    assert Client.process_url("/path") == "tielurs-heart-rate.herokuapp.com/path"
  end

  test "process_response_body parses and maps the response (excluding unknown keys)" do
    response_body = """
    {
      "activities-heart-intraday": {
        "dataset": [
         { "time": "00:00:00", "value": 96},
         { "time": "18:18:00", "value": 87},
         { "time": "18:23:00", "value": 91}
        ]
      }
    }
    """
    parsed = [%{time: "00:00:00", value: 96}, %{time: "18:18:00", value: 87}, %{time: "18:23:00", value: 91}]
    assert parsed == Client.process_response_body(response_body)
  end
end