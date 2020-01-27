defmodule Storage.Relational.Migrations.CreatePollProcedureConfigurations do
  use Ecto.Migration

  def change do
    create table(:poll_procedure_configurations) do
      add :procedure_name, :string, null: false
      add :poll_interval, :integer, default: 0  # miliseconds
    end
  end
end
