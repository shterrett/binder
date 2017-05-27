defmodule Binder.Maybe do
  @moduledoc """
  Handles nil, so the functions don't have to

  This module fills out the required interface, but many of the functions
  are somewhat irrelevant because there is no wrapping datatype
  (a la Maybe in Haskell)
  """

  @doc """
  <x or nil> -> (x -> y) -> <y or nil>
  The function (x -> y) may assume x is always present
  """
  def map(nil, _f), do: nil
  def map(x, f), do: f.(x)

  @doc """
  Exactly like map. Technically has a different signature:
  <x or nil> -> (x -> <y or nil>) -> <y or nil>
  But because Elixir does not have algebraic datatypes that values,
  the behavior is exactly the same
  """
  def bind(x, f), do: map(x, f)

  @doc """
  Simply the identity
  """
  def just(x), do: x
  @doc """
  Simply nil
  """
  def nothing(), do: nil

  @doc """
  true if value is not nil
  """
  def just?(nil), do: false
  def just?(_), do: true

  @doc """
  true if value is nil
  """
  def nothing?(nil), do: true
  def nothing?(_), do: false
end
