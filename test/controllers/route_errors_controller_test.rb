# frozen_string_literal: true

require "test_helper"

class RouteErrorsControllerTest < ActionDispatch::IntegrationTest

  test "verify error when is a wront route" do
    get "/test", headers: { "Accept" => "application/vnd.fc.v1+json", "Content-Type" => "application/json" }

    parsed_response = JSON.parse(@response.body)
    assert_equal route_not_found, parsed_response
  end

  test "verify route error when is an incorrect api version" do
    get "/jugadores/salarios", headers: { "Accept" => "application/vnd.fc.v2+json", "Content-Type" => "application/json" }

    parsed_response = JSON.parse(@response.body)
    assert_equal not_supported_version, parsed_response
  end

  def route_not_found
    { "errors" => [
      { "type"=>"inválido",
        "message"=>"Ruta no encontrada, porfavor verifique que la ruta sea la correcta"
      }]
    }
  end

  def not_supported_version
    { "errors" =>[
      { "type"=>"inválido",
        "message"=>"Version no soportada, por el momento solo puedes acceder a la version 1"
      }]
    }
  end
end
