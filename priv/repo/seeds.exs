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

# Afiliados

affiliates_data = [
  %Affiliate{
    dni: "741852963",
    name: "admin",
    correo: "admin@osunsa.org.ar",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  },
  %Affiliate{
    dni: "23079981",
    name: "SILVERA, CARLOS ALBERTO",
    correo: "csilvera@osunsa.org.ar",
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
    correo: "fkonig@osunsa.org.ar",
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
    correo: "rmedina@osunsa.org.ar",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  },
  %Affiliate{
    dni: "35106814",
    name: "ORQUERA, FERNANDO EXEQUIEL",
    correo: "forquera@osunsa.org.ar",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  },
  %Affiliate{
    dni: "24697412",
    name: "PARTY, MARIA GRACIELA",
    correo: "partymariagraciela@gmail.com",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  },
  %Affiliate{
    dni: "25729497",
    name: "LOPEZ MATA, HERNAN FERNANDO",
    correo: "",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  },
  %Affiliate{
    dni: "49196037",
    name: "LOPEZ PARTY, ROCIO",
    correo: "",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  },
  %Affiliate{
    dni: "50752690",
    name: "LOPEZ PARTY, PILAR",
    correo: "",
    password_hash: Argon2.add_hash("123456") |> Map.get(:password_hash)
  }
]

Enum.each(affiliates_data, fn data ->
  Repo.insert!(data)
end)

# Consiguiendo el changeset de un usuario
affiliate = Repo.get_by(Affiliate, correo: "admin@osunsa.org.ar")
affiliate2 = Repo.get_by(Affiliate, correo: "csilvera@osunsa.org.ar")
affiliate3 = Repo.get_by(Affiliate, correo: "fkonig@osunsa.org.ar")
affiliate4 = Repo.get_by(Affiliate, correo: "rmedina@osunsa.org.ar")
affiliate5 = Repo.get_by(Affiliate, correo: "forquera@osunsa.org.ar")
affiliate6 = Repo.get_by(Affiliate, correo: "partymariagraciela@gmail.com")

lista_affiliates = [affiliate, affiliate2, affiliate3, affiliate4, affiliate5]

# Asociando roles
lista_roles = %{"role_ids" => ["1", "2"]}

Enum.each(lista_affiliates, fn data ->
  Carnet.Affiliates.update_affiliate_roles(data, lista_roles)
end)

lista_roles = %{"role_ids" => ["2"]}

Carnet.Affiliates.update_affiliate_roles(affiliate6, lista_roles)

# Asociando Afiliados y Convenios

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
    fecha_baja: ~D[2036-10-07]
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
  },
  %AffiliateCovenant{
    titular_id: 10,
    beneficiario_id: 10,
    covenant_id: 1,
    fecha_alta: ~D[2004-02-11],
    fecha_baja: nil
  },
  %AffiliateCovenant{
    titular_id: 10,
    beneficiario_id: 11,
    covenant_id: 1,
    fecha_alta: ~D[2004-02-11],
    fecha_baja: nil
  },
  %AffiliateCovenant{
    titular_id: 10,
    beneficiario_id: 12,
    covenant_id: 1,
    fecha_alta: ~D[2008-11-03],
    fecha_baja: ~D[2029-11-03]
  },
  %AffiliateCovenant{
    titular_id: 10,
    beneficiario_id: 13,
    covenant_id: 1,
    fecha_alta: ~D[2010-11-26],
    fecha_baja: ~D[2031-11-03]
  }
]

Enum.each(data_affiliates_covenants, fn data ->
  Repo.insert!(data)
end)
