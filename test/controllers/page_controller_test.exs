defmodule HelloPhoenix.PageControllerTest do
  use HelloPhoenix.ConnCase

  setup do 
    SQL.begin_test_transaction(Repo)
    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "/index returns a list of contacts" do 
    contacts_as_json = 
      %Contact{name: "Hoge", phone: "09088889999"}
      |> Repo.insert
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/contacts") |> send_request

    assert response.status == 200
    assert response.resp_body == contacts_as_json

  end
  
end
