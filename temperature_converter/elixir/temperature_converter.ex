defmodule TemperatureConverter do
  def convert_f_to_c(temperature) do
    ((temperature * 9) / 5) + 32
  end

  def convert_c_to_f(temperature) do
    (temperature - 32) * 5 / 9
  end
end