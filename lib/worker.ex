defmodule Metex.Worker do
  @moduledoc false

  @apikey "1f9932ac458434e4433f1b0262388afb"

  def loop do
    receive do
      {sender_pid, location} ->
        send(sender_pid, {:ok, temperature_of(location)})

      _ ->
        IO.puts("don't know how to process this message")
    end

    loop()
  end

  def temperature_of(location) do
    result =
      url_for(location)
      |> HTTPoison.get()
      |> IO.inspect(label: "WTF")
      |> parse_response
      |> IO.inspect(label: "WTF")

    case result do
      {:ok, temp} ->
        "#{location}: #{temp}°C"

      :error ->
        "#{location} not found"
    end
  end

  #     # |> HTTPoison.get([], ssl: [{:versions, [:"tlsv1.2"]}])

  # Original `url_for/1`
  defp url_for(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{@apikey}"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode!() |> compute_temperature
  end

  defp parse_response(_) do
    :error
  end

  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end

  # defp apikey do
  #   "1f9932ac458434e4433f1b0262388afb"
  # end
end
