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
alias Osunsa.Roles.Role
alias Osunsa.Covenants.Covenant
alias Osunsa.Affiliates.Affiliate

# Roles
roles_data = [
  %Role{name: "admin"},
  %Role{name: "afiliado"}
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

#Afiliados

affiliates_data = [
 %Affiliate{
   dni: "741852963",
   name: "admin",
   correo: "admin@gmail.com",
   password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "23079981",
  name: "SILVERA, CARLOS ALBERTO",
  correo: "csilvera@gmail.com",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "27701132",
  name: "SANDOVAL, MONICA ELISA",
  correo: "csilvera@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "43335729",
  name: "SILVERA SANDOVAL, LUCIANA",
  correo: "csilvera@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "46800322",
  name: "SILVERA SANDOVAL, EZEQUIEL",
  correo: "csilvera@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "32165329",
  name: "KÖNIG, SERGIO FABIAN",
  correo: "fkonig@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "55094443",
  name: "KÖNIG MALCÓ, BASTIAN GAEL",
  correo: "fkonig@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "33231080",
  name: "MEDINA, RAMIRO MATIAS",
  correo: "rmedina@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "35106814",
  name: "ORQUERA, FERNANDO EXEQUIEL",
  correo: "forquera@osunsa.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 }
]

Enum.each(affiliates_data, fn data ->
  Repo.insert!(data)
end)
