# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Carnet.Repo.insert!(%Carnet.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Carnet.Repo
alias Carnet.Roles.Role
alias Carnet.Covenants.Covenant
alias Carnet.Affiliates.Affiliate
alias Carnet.AffiliatesCovenants.AffiliateCovenant

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
   correo: "admin@carnet.org.ar",
   password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "23079981",
  name: "SILVERA, CARLOS ALBERTO",
  correo: "csilvera@carnet.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "27701132",
  name: "SANDOVAL, MONICA ELISA",
  correo: "",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "43335729",
  name: "SILVERA SANDOVAL, LUCIANA",
  correo: "",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "46800322",
  name: "SILVERA SANDOVAL, EZEQUIEL",
  correo: "",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "32165329",
  name: "KÖNIG, SERGIO FABIAN",
  correo: "fkonig@carnet.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "55094443",
  name: "KÖNIG MALCÓ, BASTIAN GAEL",
  correo: "",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "33231080",
  name: "MEDINA, RAMIRO MATIAS",
  correo: "rmedina@carnet.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 },
 %Affiliate{
  dni: "35106814",
  name: "ORQUERA, FERNANDO EXEQUIEL",
  correo: "forquera@carnet.org.ar",
  password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
 }
]

Enum.each(affiliates_data, fn data ->
  Repo.insert!(data)
end)


# Consiguiendo el changeset de un usuario
affiliate = Repo.get_by(Affiliate, correo: "admin@carnet.org.ar")
affiliate2 = Repo.get_by(Affiliate, correo: "csilvera@carnet.org.ar")
affiliate3 = Repo.get_by(Affiliate, correo: "fkonig@carnet.org.ar")
affiliate4 = Repo.get_by(Affiliate, correo: "rmedina@carnet.org.ar")
affiliate5 = Repo.get_by(Affiliate, correo: "forquera@carnet.org.ar")

lista_affiliates = [affiliate, affiliate2, affiliate3, affiliate4, affiliate5]

# Asociando roles
lista_roles = %{"role_ids" => ["1", "2"]}

Enum.each(lista_affiliates, fn data ->
  IO.inspect(data)
end)

Enum.each(lista_affiliates, fn data ->
  Carnet.Affiliates.update_affiliate_roles(data, lista_roles)
end)


#Asociando Afiliados y Convenios

data_affiliates_covenants = [
  %AffiliateCovenant{
    titular_id: 2,
    beneficiario_id: 2,
    covenant_id: 2,
    fecha_alta: ~D[2012-03-01],
    fecha_baja: nil
  },
  %AffiliateCovenant{
    titular_id: 2,
    beneficiario_id: 3,
    covenant_id: 2,
    fecha_alta: ~D[2012-03-01],
    fecha_baja: nil
  },
  %AffiliateCovenant{
    titular_id: 2,
    beneficiario_id: 4,
    covenant_id: 2,
    fecha_alta: ~D[2012-03-01],
    fecha_baja: ~D[2022-03-08]
  },
  %AffiliateCovenant{
    titular_id: 2,
    beneficiario_id: 5,
    covenant_id: 2,
    fecha_alta: ~D[2012-03-01],
    fecha_baja: ~D[2027-06-04]
  },
  %AffiliateCovenant{
    titular_id: 6,
    beneficiario_id: 6,
    covenant_id: 2,
    fecha_alta: ~D[2011-01-11],
    fecha_baja: nil
  },
  %AffiliateCovenant{
    titular_id: 6,
    beneficiario_id: 7,
    covenant_id: 2,
    fecha_alta: ~D[2015-10-09],
    fecha_baja: ~D[2036-10-07],
  },
  %AffiliateCovenant{
    titular_id: 8,
    beneficiario_id: 8,
    covenant_id: 2,
    fecha_alta: ~D[2013-03-18],
    fecha_baja: nil
  },
  %AffiliateCovenant{
    titular_id: 9,
    beneficiario_id: 9,
    covenant_id: 2,
    fecha_alta: ~D[2017-08-13],
    fecha_baja: nil
  }
]

Enum.each(data_affiliates_covenants, fn data ->
  Repo.insert!(data)
end)
