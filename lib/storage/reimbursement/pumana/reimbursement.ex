defmodule Storage.Reimbursement.Pumana.Reimbursement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pumana_reimbursements" do
    field :procedure_name, :string
    field :procedure_id, Ecto.UUID, autogenerate: true
    field :reimbursement_amount, :decimal
  end

  def changeset(pumana_reimbursement, params \\ %{}) do
    pumana_reimbursement
    |> cast(params, [
      :procedure_name,
      :reimbursement_amount
    ])
    |> validate_required([:procedure_name, :reimbursement_amount])
  end

  def get_reimbursement_by_procedure_name(procedure_name) do
    Storage.Relational.get_by(Storage.Reimbursement.Pumana.Reimbursement, procedure_name: procedure_name)
  end
end
