defmodule Storage.Relational.Migrations.CreatePumanaReimbursements do
  use Ecto.Migration

  def change do
    create table(:pumana_reimbursements) do
      add :procedure_name, :string, null: false
      add :procedure_id, :uuid, null: false
      add :reimbursement_amount, :decimal, default: 0
    end
    create unique_index(:pumana_reimbursements, [:procedure_id])
  end
end
