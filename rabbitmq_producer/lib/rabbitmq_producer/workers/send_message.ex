defmodule RabbitmqProducer.Workers.SendMessage do
  use GenServer

  def init(_) do
    {:ok, nil}
  end

  def start_link(_) do
    IO.puts("Worker SendMessage started")
    GenServer.start_link(__MODULE__, %{})
  end

  def start() do
    message = IO.gets("Escreva a mensagem: ")
    send_message(message)
  end

  def send_message(message) do
    queue_name = "fila.das.mensagens"
    {:ok, connection} =
      AMQP.Connection.open("amqp://guest:guest@localhost")
    {:ok, channel} = AMQP.Channel.open(connection)

    # Garantindo que a fila existe
    AMQP.Queue.declare(channel, queue_name)
    AMQP.Basic.publish(channel, "", queue_name, message)

    IO.puts " [x] Mensagem enviada!'"
    start()
  end
end
