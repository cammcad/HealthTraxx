defmodule Storage.Procedure.PollProcedureConfiguration do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query

  schema "poll_procedure_configurations" do
    field :procedure_name, :string
    field :poll_interval, :integer, default: 0
  end

  def changeset(poll_procedure_configuration, params \\ %{}) do
    poll_procedure_configuration
    |> cast(params, [
      :procedure_name,
      :poll_interval
    ])
    |> validate_required([:procedure_name, :poll_interval])
  end

  def get_all_procedure_configurations() do
    query = from(__MODULE__)
    Storage.Relational.all(query)
  end

end
