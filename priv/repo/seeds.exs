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
alias Osunsa.Covenants.Covenant
alias Osunsa.Affiliates.Affiliate

# Roles
roles_data = [
  %Rol{name: "admin"},
  %Rol{name: "afiliado"}
]

Enum.each(roles_data, fn data ->
  Repo.insert!(data)
end)

# Convenios
convenios_data = [
  %Covenant{
    name: "Personal de UNSa",
    description: ""
  },
  %Covenant{
    name: "Personal de OSUNSa",
    description: ""
  },
  %Covenant{
    name: "Personal de CIUNSa",
    description: ""
  },
  %Covenant{
    name: "Reciprocidad",
    description: ""
  },
  %Covenant{
    name: "Adherentes",
    description: ""
  },
  %Covenant{
    name: "Jubilados",
    description: ""
  },
  %Covenant{
    name: "Transitorio",
    description: ""
  },
  %Covenant{
    name: "Conicet",
    description: ""
  }
]

Enum.each(convenios_data, fn data ->
  Repo.insert!(data)
end)
