# frozen_string_literal: true

require "test_helper"

class V1::SalariesControllerTest < ActionDispatch::IntegrationTest
  test "calculate players salaries, but the json schema was incorrect" do
    get "/jugadores/salarios",
    headers: { "Accept" => "application/vnd.fc.v1+json", "Content-Type" => "application/json" },
    params: { "_json" => players}


    parsed_response = JSON.parse(@response.body)
    assert_equal validate_schema_error, parsed_response
  end

  test "calculate players salaries, but the content-type header is missing" do
    get "/jugadores/salarios",
    headers: { "Accept" => "application/vnd.fc.v1+json" },
    params: {  "_json" => players }


    parsed_response = JSON.parse(@response.body)
    assert_equal validate_media_type_header, parsed_response
  end

  test "calculate players salaries, but players is empty" do
    get "/jugadores/salarios",
    headers: { "Accept" => "application/vnd.fc.v1+json", "Content-Type" => "application/json" },
    params: {  "_json" => [] }


    parsed_response = JSON.parse(@response.body)
    assert_equal empty_players_response, parsed_response
  end

  def validate_schema_error
    { "errors" =>
      [{
        "type" => "inválido",
        "message" => "Estructura del JSON incorrecta, favor de verificar los valores"
      }]
    }
  end

  def empty_players_response
    { "errors" =>
      [{
        "type" => "inválido",
        "message" => "Agrega jugadores para calcular el salario"
      }]
    }
  end

  def validate_media_type_header
    {"errors"=>[{"type"=>"inválido", "message"=>"Media type no soportado"}]}
  end

  def players_with_wrong_schema
    [
      {
        "nombre": "Juan Perez",
        "nivel": "C",
        "goles": 10,
        "sueldo": 50000,
        "bono": "hello",
        "sueldo_completo": null,
        "equipo": "rojo"
      }
    ]
  end
end
