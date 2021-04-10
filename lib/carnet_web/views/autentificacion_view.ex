defmodule CarnetWeb.AutentificacionView do
  use CarnetWeb, :view
  #alias CarnetWeb.AutentificacionView

  def render("auth.json", %{affiliate: affiliate, token: jwt, roles: roles}) do
    %{data: %{
      id: affiliate.id,
      name: affiliate.name,
      correo: affiliate.correo,
      token: jwt,
      roles: render_many(roles, CarnetWeb.RoleView, "role.json") #TODO VER SI CAMBIAR ADMIN.CONTROLLER O NO
    }}
  end

end
