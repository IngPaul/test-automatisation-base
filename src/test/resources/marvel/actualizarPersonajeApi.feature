@REQ_TEST-111 @HU111 @Agente2
Feature: TEST-111 Actualizar personajes en Marvel API

Background:
  * def timestamp = function(){ return java.lang.System.currentTimeMillis() + '' }

  @id:1 @updateCharacter @solicitudExitosa200
  Scenario: T-API-TEST-111-CA07-Actualizar personaje exitosamente 200 - karate
    * def updateRequest =
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Updated description",
      "powers": ["Armor", "Flight"]
    }
    """
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/paul/api/characters/1'
    And request updateRequest
    When method PUT
    Then status 200
    And match response.name == updateRequest.name
    And match response.alterego == updateRequest.alterego
    And match response.powers == updateRequest.powers

  @id:2 @updateCharacter @personajeNoEncontrado404
  Scenario: T-API-TEST-111-CA08-Actualizar personaje no encontrado 404 - karate
    * def updateRequest =
    """
      {
        "name": "Iron Man",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
    """
    And request updateRequest
    When method PUT
    Then status 404
    And match response.error == 'Character not found'