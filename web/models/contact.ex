defmodule HelloPhoenix.Contact do
  use HelloPhoenix.Web, :model

  schema "contacts" do
    field :name, :string
    field :phone, :string

    timestamps
  end

  @required_fields ~w(name phone)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
