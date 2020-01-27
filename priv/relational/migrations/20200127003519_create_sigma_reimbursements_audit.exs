defmodule Storage.Relational.Migrations.CreateSigmaReimbursementsAudit do
  use Ecto.Migration

  def change do
    create table(:sigma_reimbursements_audit) do
      add :procedure_name, :string, null: false
      add :procedure_id, :integer, null: false
      add :avg_reimb, :decimal, null: true

      timestamps([inserted_at: :last_scraped_at, updated_at: false])
    end
  end
end
