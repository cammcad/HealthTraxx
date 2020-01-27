defmodule ScrapingService.Application do
  @moduledoc false

  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Storage.Relational,
      ScrapingService.Payors.Supervisor,
      ScrapingService.Poller.Supervisor
      ]
    opts = [strategy: :one_for_one, name: ScrapingService.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
