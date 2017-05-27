# Binder

A simple library to allow easy piping of functions that return `{ :ok, ... }` or
`{ :error, ... }`, as well as functions that may return `nil`.

## Usage

### Either

Imagine needing to chain multiple functions that may return `{ :ok, ... }`
tuples (and potentially some that may not). For instance, given functions
`might_succed_*` that take in a value and return either `{ :ok, ... }` or `{
:error, ... }` tuples, and a function `do_a_thing` that simply takes a value and
transforms it, the functions can be piped together like this

```elixir
x
|> might_succeed_1
|> Either.bind(&might_succeed_2/1)
|> Either.map(&do_a_thing/1)
|> Either.bind(&might_succeed_3/1)
```

### Maybe

For functions that can return `nil`, `Maybe` allows the piping together of
functions and handles the `nil` so that the functions don't have to:

```elixir
x
|> maybe_nil_1
|> Maybe.map(&maybe_nil_2/1)
|> Maybe.bind(&maybe_nil_2/1)
|> Maybe.bind(&do_a_thing/1)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `binder` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:binder, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/binder](https://hexdocs.pm/binder).

