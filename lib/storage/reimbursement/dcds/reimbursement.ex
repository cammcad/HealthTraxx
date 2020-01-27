defmodule Storage.Reimbursement.Dcds.Reimbursement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dcds_reimbursements" do
    field :procedure_name, :string
    field :procedure_id, :string
    field :refund, :decimal
  end

  def changeset(dcds_reimbursement, params \\ %{}) do
    dcds_reimbursement
    |> cast(params, [
      :procedure_name,
      :procedure_id,
      :refund
    ])
    |> validate_required([:procedure_name, :procedure_id])
  end

  def get_reimbursement_by_procedure_name(procedure_name) do
    Storage.Relational.get_by(Storage.Reimbursement.Dcds.Reimbursement, procedure_name: procedure_name)
  end
end
