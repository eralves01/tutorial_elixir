defmodule RabbitmqProducerTest do
  use ExUnit.Case
  doctest RabbitmqProducer

  test "greets the world" do
    assert RabbitmqProducer.hello() == :world
  end
end
