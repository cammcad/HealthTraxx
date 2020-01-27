defmodule Storage.Reimbursement.Sigma.ReimbursementAudit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sigma_reimbursements_audit" do
    field :procedure_name, :string
    field :procedure_id, :integer
    field :avg_reimb, :decimal

    timestamps()
  end

  def changeset(sigma_reimbursement_audit, params \\ %{}) do
    sigma_reimbursement_audit
    |> cast(params, [
      :procedure_name,
      :procedure_id,
      :avg_reimb
    ])
    |> validate_required([:procedure_name, :procedure_id])
  end
end
