@REQ_TEST-111 @HU111 @Agente2
Feature: TEST-111 Crear personajes en Marvel API

Background:
  * def timestamp = function(){ return java.lang.System.currentTimeMillis() + '' }
    
  @id:1 @createCharacter @createCharacterSolicitudExitosa200
  Scenario: T-API-TEST-111-CA04-Crear personaje exitosamente 200 - karate
    * def createCharacterRequest =
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Genius billionaire",
      "powers": ["Armor", "Flight"]
    }
    """
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/paul/api/characters'
    And request createCharacterRequest
    When method POST
    Then status 200
    And match response.id == '#number'
    And match response.name == createCharacterRequest.name
    And match response.alterego == createCharacterRequest.alterego
    And match response.description == createCharacterRequest.description
    And match response.powers == createCharacterRequest.powers
    * def createdCharacterId = response.id

  #Analizar despues
  @id:2 @createCharacter @nombreDuplicado400
  Scenario: T-API-TEST-111-CA05-Crear personaje con nombre duplicado 400 - karate
    * def createCharacterRequest =
    """
    {
      "name": "Iron Man",
      "alterego": "Otro",
      "description": "Otro",
      "powers": ["Armor"]
    }
    """
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/paul/api/characters'
    And request createCharacterRequest
    When method POST
    Then status 400
    And match response.error == 'Character name already exists'
    
  @id:3 @createCharacter @camposRequeridos400
  Scenario: T-API-TEST-111-CA06-Crear personaje con campos requeridos faltantes 400 - karate
    * def createCharacterRequest =
    """
    {
      "name": "",
      "alterego": "",
      "description": "",
      "powers": []
    }
    """
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/paul/api/characters'
    And request createCharacterRequest
    When method POST
    Then status 400
    And match response.name == 'Name is required'
    And match response.description == 'Description is required'
    And match response.powers == 'Powers are required'
    And match response.alterego == 'Alterego is required'