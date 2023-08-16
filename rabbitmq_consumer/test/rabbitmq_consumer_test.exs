defmodule RabbitmqConsumerTest do
  use ExUnit.Case
  doctest RabbitmqConsumer

  test "greets the world" do
    assert RabbitmqConsumer.hello() == :world
  end
end
