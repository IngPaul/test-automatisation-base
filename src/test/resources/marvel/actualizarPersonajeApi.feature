@REQ_TEST-111 @HU111 @Agente2
Feature: TEST-111 Actualizar personajes en Marvel API

  Background:
    * def randomNumber = function(){ return java.util.concurrent.ThreadLocalRandom.current().nextInt(0, 100000) + '' }
    * def value = randomNumber()
    * print 'Valor aleatorio:', value
    * def username = "paul11111"
    * print 'Username:', username

  @id:1 @updateCharacterSolicitudExitosa200
  Scenario: T-API-TEST-111-CA07-Actualizar personaje exitosamente dependiente de la existencia en base200
    * def updateRequest =
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Updated description",
      "powers": ["Armor", "Flight"]
    }
    """
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/1'
    And request updateRequest
    When method PUT
    Then status 200
    And match response.name == updateRequest.name
    And match response.alterego == updateRequest.alterego
    And match response.powers == updateRequest.powers

  @id:2 @updateCharacterSolicitudExitosaCompleta200
  Scenario: T-API-TEST-111-CA07-Actualizar personaje completamente exitoso200
    * call read('crearPersonajeApi.feature@createCharacterCreateCharacterSolicitudExitosaCompleta')
    * def updateRequest =
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Updated description",
      "powers": ["Armor", "Flight"]
    }
    """
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/' + createdCharacterId
    And request updateRequest
    When method PUT
    Then status 200
    And match response.name == updateRequest.name
    And match response.alterego == updateRequest.alterego
    And match response.powers == updateRequest.powers

  @id:3 @updateCharacterPersonajeNoEncontrado404
  Scenario: T-API-TEST-111-CA08-Actualizar personaje no encontrado 404
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