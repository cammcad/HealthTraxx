defmodule ScrapingService.Poller.Poller do

  @moduledoc """
  Documentation for Poller.
  polls for procedures to scrape for reimbursement amounts
  """
  use GenServer
  require Logger

  alias ScrapingService.Poller.Facilitator
  alias ScrapingService.Procedure.Procedure

  # -------------#
  # Client - API #
  # -------------#
    def start_link(default), do: GenServer.start_link(__MODULE__, default, name: __MODULE__)

    def start_poller(), do: GenServer.cast(__MODULE__, :start_poller)

    def stop_poller(), do: GenServer.cast(__MODULE__, :stop_poller)

  ##---------- ##
  #Server - API #
  ##-----------##

    @impl true
    def init(_), do: {:ok, {:status, :started}}

    @impl true
    def handle_cast(:start_poller, {:status, :started} = _state) do
      Facilitator.setup_poller_callback_timers(self())
      Logger.info "Poller: started!"
      {:noreply, {:status, :polling}}
    end

    def handle_cast(:start_poller, {:status, :stopped} = _state) do
      Facilitator.setup_poller_callback_timers(self())
      Logger.info "Poller: started!"
      {:noreply, {:status, :polling}}
    end

    def handle_cast(:start_poller, {:status, :polling} = state), do: {:noreply, state}

    @impl true
    def handle_cast(:stop_poller, {:status, :polling} = _state) do
      Logger.info "Poller: stopped!"
      {:noreply, {:status, :stopped}}
    end

    def handle_cast(:stop_poller, {:status, :stopped} = state) do
      Logger.info "Poller: stopped!"
      {:noreply, state}
    end

    @impl true
    def handle_info({:poll_procedure_reimbursement, %Procedure{} = procedure}, {:status, :polling} = state) do
      Facilitator.broadcast_procedure_to_payors(procedure)
      Facilitator.reset_procedure_timer(self(), procedure)
      {:noreply, state}
    end

    def handle_info({:poll_procedure_reimbursement, %Procedure{} = _}, {:status, :stopped} = state) do
      # no-op
      {:noreply, state}
    end
end
