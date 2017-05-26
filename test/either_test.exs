defmodule EitherTest do
  use ExUnit.Case
  alias Binder.Either

  test "map over { :ok, a } returns { :ok, b }" do
    assert { :ok, 2 } == Either.map({ :ok, 1 }, &plus_one/1 )
  end

  test "map over { :error, a } returns { :error, a }" do
    assert { :error, 1 } == Either.map({ :error, 1 }, &plus_one/1)
  end

  test "map over :error returns :error" do
    assert :error == Either.map(:error, &plus_one/1)
  end

  test "bind over { :ok, a }, returning { :ok, b }, returns { :ok, b }" do
    assert { :ok, 2 } == Either.bind({ :ok, 1 }, &positive_plus_one/1)
  end

  test "bind over { :ok, a }, returning { :error, b }, returns { :error, b }" do
    assert { :error, "cannot add negative numbers" } ==
           Either.bind({ :ok, -1 }, &positive_plus_one/1)
  end

  test "bind over { :error, a } returns { :error, a }" do
    assert { :error, "something went wrong" } ==
           Either.bind({ :error, "something went wrong" }, &positive_plus_one/1)
  end

  test "bind over :error returns :error" do
    assert :error == Either.bind(:error, &positive_plus_one/1)
  end

  test "ok a returns { :ok, a }" do
    assert { :ok, 1 } == Either.ok(1)
  end

  test "err a returns { :error, a }" do
    assert { :error, "whoops" } == Either.err("whoops")
  end

  test "ok? returns true if ok, otherwise false" do
    assert true == Either.ok?({ :ok, 1 })
    assert false == Either.ok?({ :error, 1 })
    assert false == Either.ok?(:error)
  end

  test "err? returns true if err, otherwise false" do
    assert false == Either.err?({ :ok, 1 })
    assert true == Either.err?({ :error, 1 })
    assert true == Either.err?(:error)
  end

  defp plus_one(n), do: n + 1
  defp positive_plus_one(n) do
    if n > 0 do
      { :ok, n + 1 }
    else
      { :error, "cannot add negative numbers" }
    end
  end
end
