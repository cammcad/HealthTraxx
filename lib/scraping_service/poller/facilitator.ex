defmodule ScrapingService.Poller.Facilitator do

  alias ScrapingService.Procedure.Procedure
  alias Storage.Procedure.ProcedureStore
  alias Storage.Procedure.PollProcedureConfiguration

  def setup_poller_callback_timers(pid) do
    get_procedure_schedules()
    |> Enum.each(fn procedure_schedule ->
      setup_poller_callback_timer(pid, procedure_schedule)
    end)
  end

  @spec get_procedure_schedules :: [] | [%PollProcedureConfiguration{}]
  def get_procedure_schedules(), do: ProcedureStore.get_procedures_schedules()

  @spec get_procedure_schedule_by_name(String.t()) :: [] | [%PollProcedureConfiguration{}]
  def get_procedure_schedule_by_name(name) do
    get_procedure_schedules()
    |> Enum.filter(fn %PollProcedureConfiguration{id: _, procedure_name: procedure_name, poll_interval: _} ->
      String.downcase(procedure_name) == String.downcase(name) end)
  end

  def setup_poller_callback_timer(
        pid,
        %PollProcedureConfiguration{id: _, procedure_name: name, poll_interval: interval}
      ) do
    Process.send_after(pid, {:poll_procedure_reimbursement, %Procedure{procedure_name: name}}, interval)
  end

  def broadcast_procedure_to_payors(%Procedure{} = procedure) do
    Supervisor.which_children(ScrapingService.Payors.Supervisor)
    |> Enum.each(fn {module,_,_,_} -> apply(module, :scrape_reimbursement_amount_for, [procedure]) end)
  end

  def reset_procedure_timer(pid, %Procedure{procedure_name: name}) do
    [%PollProcedureConfiguration{id: _, procedure_name: procedure_name, poll_interval: interval}] = get_procedure_schedule_by_name(name)
    Process.send_after(pid, {:poll_procedure_reimbursement, %Procedure{procedure_name: procedure_name}}, interval)
  end
end
