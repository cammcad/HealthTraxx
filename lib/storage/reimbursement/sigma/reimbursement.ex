defmodule Storage.Reimbursement.Sigma.Reimbursement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sigma_reimbursements" do
    field :procedure_name, :string
    field :procedure_id, :integer
    field :avg_reimb, :decimal
  end

  def changeset(sigma_reimbursement, params \\ %{}) do
    sigma_reimbursement
    |> cast(params, [
      :procedure_name,
      :procedure_id,
      :avg_reimb
    ])
    |> validate_required([:procedure_name, :procedure_id])
  end

  def get_reimbursement_by_procedure_name(procedure_name) do
    Storage.Relational.get_by(Storage.Reimbursement.Sigma.Reimbursement, procedure_name: procedure_name)
  end
end
