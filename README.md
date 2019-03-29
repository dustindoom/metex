# Metex

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `metex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:metex, "~> 0.1.0"}
  ]
end
```

## Purpose

This is the `Metex` example naïve version of a weather application from the book 'The Little Elixir
& OTP Guidebook. It will contain all the logic needed to make a request, parse the response, and
 return the result, but no concurrency will be involved.

It is slightly altered from the original version to correct for versioning discrepencies since the
printing of the text.

I wrote it as a stand in for the `portal-v3` app so that I could ensure the end to end testing app I was
writing would operate correctly. It is currently without said testing app.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/metex](https://hexdocs.pm/metex).

