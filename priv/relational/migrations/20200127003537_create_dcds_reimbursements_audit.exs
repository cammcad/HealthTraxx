defmodule Storage.Relational.Migrations.CreateDcdsReimbursementsAudit do
  use Ecto.Migration

  def change do
    create table(:dcds_reimbursements_audit) do
      add :procedure_name, :string, null: false
      add :procedure_id, :string, null: false
      add :refund, :decimal, null: true

      timestamps([inserted_at: :last_scraped_at, updated_at: false])
    end
  end
end
