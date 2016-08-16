defmodule Rumbl.CategoryRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.Category

  test "alphabetical/1 orders by name" do
    Repo.insert!(%Category{name: "c"})
    Repo.insert!(%Category{name: "d"})
    Repo.insert!(%Category{name: "b"})
    Repo.insert!(%Category{name: "a"})

    query = Category.alphabetical(Category)
    query = from c in query, select: c.name

    assert Repo.all(query) == ~w(a b c d)
  end
end
