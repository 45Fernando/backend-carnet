# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Osunsa.Repo.insert!(%Osunsa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Osunsa.Repo
alias Osunsa.Roles.Rol

# Seed de Roles

# Roles
roles_data = [
  %Rol{name: "admin"},
  %Rol{name: "afiliado"}
]

Enum.each(roles_data, fn data ->
  Repo.insert!(data)
end)
