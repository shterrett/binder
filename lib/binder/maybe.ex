defmodule Binder.Maybe do
  def map(nil, _f), do: nil
  def map(x, f), do: f.(x)

  def bind(x, f), do: map(x, f)

  def just(x), do: x
  def nothing(), do: nil

  def just?(nil), do: false
  def just?(_), do: true

  def nothing?(nil), do: true
  def nothing?(_), do: false
end
