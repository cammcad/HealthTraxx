defmodule Storage.Reimbursement.Dcds.ReimbursementAudit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dcds_reimbursements_audit" do
    field :procedure_name, :string
    field :procedure_id, :string
    field :refund, :decimal

    timestamps()
  end

  def changeset(dcds_reimbursement_audit, params \\ %{}) do
    dcds_reimbursement_audit
    |> cast(params, [
      :procedure_name,
      :procedure_id,
      :refund
    ])
    |> validate_required([:procedure_name, :procedure_id])
  end
end
