defmodule HelloPhoenix.ContactTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Contact

  @valid_attrs %{name: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Contact.changeset(%Contact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contact.changeset(%Contact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
