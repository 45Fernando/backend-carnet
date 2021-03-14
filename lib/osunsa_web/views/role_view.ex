defmodule OsunsaWeb.RoleView do
  use OsunsaWeb, :view

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{data: render_one(role, RoleView, "role.json")}
  end

  def render("role.json", %{role: role}) do
    %{id: role.id,
      role_name: role.name}
  end
end
