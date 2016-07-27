defmodule Rumbl.Repo do


  @moduledoc """
  In memory Repository
  """

  def get(module, id) do
    IO.inspect module
    Enum.find all(module), &(&1.id == id) 
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) === val end)
    end
  end


  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "José", username: "josevalim", password: "elixir"},
     %Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
     %Rumbl.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}]
  end
  def all(_module), do: []

   def start_link do
    {:ok, self}
   end
end
