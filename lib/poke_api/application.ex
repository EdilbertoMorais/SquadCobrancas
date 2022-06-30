defmodule PokeApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PokeApi.Repo,
      # Start the Telemetry supervisor
      PokeApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PokeApi.PubSub},
      # Start the Endpoint (http/https)
      PokeApiWeb.Endpoint
      # Start a worker by calling: PokeApi.Worker.start_link(arg)
      # {PokeApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PokeApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PokeApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
