defmodule RabbitmqConsumer.Workers.ReceiveMessage do
  use GenServer

  def init(_) do
    start()
    {:ok, nil}
  end

  def start_link(_) do
    IO.puts("Worker ReceiveMessage started")
    GenServer.start_link(__MODULE__, nil, name: :worker)
  end

  def start() do
    receive_message()
  end

  def receive_message() do
    queue_name = "fila.das.mensagens"
    {:ok, connection} =
      AMQP.Connection.open("amqp://guest:guest@localhost")
    {:ok, channel} = AMQP.Channel.open(connection)

    # Garantindo que a fila existe
    AMQP.Queue.declare(channel, queue_name)

    AMQP.Basic.consume(channel, queue_name, nil, no_ack: true)

    IO.puts " [*] Waiting for messages. To exit press CTRL+C, CTRL+C"
    wait_for_messages()
  end

  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts " [x] Received #{payload}"
        wait_for_messages()
    end
  end
end
