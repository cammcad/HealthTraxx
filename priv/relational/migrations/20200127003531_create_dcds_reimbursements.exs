defmodule Storage.Relational.Migrations.CreateDcdsReimbursements do
  use Ecto.Migration

  def change do
    create table(:dcds_reimbursements) do
      add :procedure_name, :string, null: false
      add :procedure_id, :string, null: false
      add :refund, :decimal, null: true
    end
  end
end
