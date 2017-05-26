defmodule Binder.Either do
  def map({ :ok, x }, f) do
    { :ok, f.(x) }
  end
  def map({ :error, _x } = err, _f) do
    err
  end
  def map(:error, _f) do
    :error
  end

  def bind({ :ok, x }, f) do
    f.(x)
  end
  def bind({ :error, _x } = err, _f) do
    err
  end
  def bind(:error, _f) do
    :error
  end

  def ok(x), do: { :ok, x }
  def err(x), do: { :error, x }

  def ok?({ :ok, _ }), do: true
  def ok?(_), do: false

  def err?({ :error, _ }), do: true
  def err?(:error), do: true
  def err?(_), do: false
end
