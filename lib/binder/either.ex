defmodule Binder.Either do
  @moduledoc """
  Handle functions that return success or error tuples
  In the types below, the tuple is designated as { <msg>, <value> }
  where <msg> is either :ok or :error

  ok => { :ok, <value> }
  error => { :error, <value> }
  """

  @doc """
  { <msg>, x } -> (x -> y) -> { <msg>, y }
  """
  def map({ :ok, x }, f) do
    { :ok, f.(x) }
  end
  def map({ :error, _x } = err, _f) do
    err
  end
  def map(:error, _f) do
    :error
  end

  @doc """
  { <msg>, x } -> (x -> { <msg>, <y> }) -> { <msg>, y }
  """
  def bind({ :ok, x }, f) do
    f.(x)
  end
  def bind({ :error, _x } = err, _f) do
    err
  end
  def bind(:error, _f) do
    :error
  end

  @doc """
  x -> { :ok, x }
  """
  def ok(x), do: { :ok, x }
  @doc """
  x -> { :error, x }
  """
  def err(x), do: { :error, x }

  @doc """
  returns true if { :ok, <value> }
  """
  def ok?({ :ok, _ }), do: true
  def ok?(_), do: false

  @doc """
  returns true if { :error, <value> } or :error
  """
  def err?({ :error, _ }), do: true
  def err?(:error), do: true
  def err?(_), do: false
end
