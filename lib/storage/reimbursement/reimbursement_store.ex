defmodule Storage.Reimbursement.ReimbursementStore do
  @moduledoc false

  alias ScrapingService.Procedure.PayorProcedure

  def is_procedure_supported?(%PayorProcedure{payor_name: "pumana", procedure_name: procedure_name, procedure_id: _} = payor_procedure) do
    reimbursement =
       Storage.Reimbursement.Pumana.Reimbursement.get_reimbursement_by_procedure_name(procedure_name)
    case reimbursement.reimbursement_amount == nil do
      false -> {:supported, %{payor_procedure | procedure_id: reimbursement.procedure_id}}
      true -> :not_supported
    end
  end

  def is_procedure_supported?(%PayorProcedure{payor_name: "dcds", procedure_name: procedure_name, procedure_id: _} = payor_procedure) do
    reimbursement =
      Storage.Reimbursement.Dcds.Reimbursement.get_reimbursement_by_procedure_name(procedure_name)
    case reimbursement.refund == nil do
      false -> {:supported, %{payor_procedure | procedure_id: reimbursement.procedure_id}}
      true -> :not_supported
    end
  end

  def is_procedure_supported?(%PayorProcedure{payor_name: "sigma", procedure_name: procedure_name, procedure_id: _} = payor_procedure) do
    reimbursement =
      Storage.Reimbursement.Sigma.Reimbursement.get_reimbursement_by_procedure_name(procedure_name)
    case reimbursement.avg_reimb == nil do
      false -> {:supported, %{payor_procedure | procedure_id: reimbursement.procedure_id}}
      true -> :not_supported
    end
  end
end
