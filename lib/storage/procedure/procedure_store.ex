defmodule Storage.Procedure.ProcedureStore do

  alias Storage.Procedure.PollProcedureConfiguration

  @spec get_procedures_schedules :: [] | [%PollProcedureConfiguration{}]
  def get_procedures_schedules() do
    PollProcedureConfiguration.get_all_procedure_configurations()
  end
end
