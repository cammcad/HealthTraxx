defmodule ScrapingService.Poller.Supervisor do
  @moduledoc false
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    # List all child processes to be supervised
    children = [ScrapingService.Poller.Poller]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
