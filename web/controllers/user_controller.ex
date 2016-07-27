defmodule Rumbl.UserController do
  use Rumbl.Web, :controller

  def index(conn, params) do
    render conn, "index.html", users: Repo.all(Rumbl.User)
  end

  def show(conn, %{"id" => id}) do
    render conn, "show.html", user: Repo.get(Rumbl.User, id)
  end
end
