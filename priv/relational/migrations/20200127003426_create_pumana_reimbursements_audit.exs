defmodule Storage.Relational.Migrations.CreatePumanaReimbursementsAudit do
  use Ecto.Migration

  def change do
    create table(:pumana_reimbursements_audit) do
      add :procedure_name, :string, null: false
      add :procedure_id, :uuid, null: false
      add :reimbursement_amount, :decimal, default: 0

      timestamps([inserted_at: :last_scraped_at, updated_at: false])
    end
  end
end
