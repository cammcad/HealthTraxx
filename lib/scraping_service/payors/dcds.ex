defmodule ScrapingService.Payors.Dcds do
  @moduledoc false
  use GenServer
  require Logger

  alias ScrapingService.Procedure.Procedure
  alias ScrapingService.Procedure.PayorProcedure
  alias ScrapingService.Payors.Facilitator

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default, name: __MODULE__)
  end

  @spec scrape_reimbursement_amount_for(ScrapingService.Procedure.Procedure.t()) :: :ok
  def scrape_reimbursement_amount_for(%Procedure{} = procedure) do
    GenServer.cast(__MODULE__, {:scrape, procedure})
  end


  @impl true
  def init(default) do
    {:ok, default}
  end

  @impl true
  def handle_cast({:scrape, %Procedure{procedure_name: procedure_name}}, state) do
    case Facilitator.is_procedure_supported_by_payor?(%PayorProcedure{payor_name: "dcds", procedure_name: procedure_name}) do
      :not_supported -> Logger.info "Procedure: #{inspect(procedure_name)} not supported by Dcds"
      {:supported, %PayorProcedure{} = payor_procedure} -> Facilitator.scrape(payor_procedure)
    end
    {:noreply, state}
  end

end
