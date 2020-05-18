# frozen_string_literal: true

class Player
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  attr_accessor :nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo, :goles_minimos

  def attributes
    {
      nombre: nombre,
      goles_minimos: goles_minimos,
      goles: goles,
      sueldo: sueldo,
      bono: bono,
      sueldo_completo: sueldo_completo,
      equipo: equipo
    }
  end
end
