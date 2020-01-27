defmodule Storage.Relational.Migrations.CreateSigmaReimbursements do
  use Ecto.Migration

  def change do
    create table(:sigma_reimbursements) do
      add :procedure_name, :string, null: false
      add :procedure_id, :integer, null: false
      add :avg_reimb, :decimal, null: true
    end
  end
end
