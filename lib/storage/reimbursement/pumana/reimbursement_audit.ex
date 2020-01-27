defmodule Storage.Reimbursement.Pumana.ReimbursementAudit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pumana_reimbursements_audit" do
    field :procedure_name, :string
    field :procedure_id, Ecto.UUID
    field :reimbursement_amount, :decimal

    timestamps()
  end

  def changeset(pumana_reimbursement_audit, params \\ %{}) do
    pumana_reimbursement_audit
    |> cast(params, [
      :procedure_name,
      :procedure_id,
      :reimbursement_amount
    ])
    |> validate_required([:procedure_name, :procedure_id, :reimbursement_amount])
  end
end
