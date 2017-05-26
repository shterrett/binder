defmodule MaybeTest do
  use ExUnit.Case
  alias Binder.Maybe

  test "map over a returns b" do
    assert 2 == Maybe.map(1, &plus_one/1)
  end

  test "map over nil returns nil" do
    assert nil == Maybe.map(nil, &plus_one/1)
  end

  test "bind over a, returning b, returns b" do
    assert 2 == Maybe.bind(1, &positive_plus_one/1)
  end

  test "bind over a, returning nil, returns nil" do
    assert nil == Maybe.bind(-1, &positive_plus_one/1)
  end

  test "bind over nil returns nil" do
    assert nil == Maybe.bind(nil, &positive_plus_one/1)
  end

  test "just a returns a" do
    assert 1 == Maybe.just(1)
  end

  test "nothing returns nil" do
    assert nil == Maybe.nothing()
  end

  test "just? returns true if not nil" do
    assert true == Maybe.just?(1)
    assert false == Maybe.just?(nil)
  end

  test "nothing? returns true if nil" do
    assert false == Maybe.nothing?(1)
    assert true == Maybe.nothing?(nil)
  end

  defp plus_one(n), do: n + 1
  defp positive_plus_one(n) do
    if n > 0 do
      n + 1
    else
      nil
    end
  end
end
