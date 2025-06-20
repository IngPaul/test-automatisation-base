@REQ_TEST-111 @HU111 @Agente2
Feature: TEST-111 Obtener personajes de Marvel API

  Background:
    * def randomNumber = function(){ return java.util.concurrent.ThreadLocalRandom.current().nextInt(0, 100000) + '' }
    * def value = randomNumber()
    * print 'Valor aleatorio:', value
    * def username = "paul11111"
    * print 'Username:', username


  @id:1 @getCharactersSolicitudExitosa200
  Scenario: T-API-TEST-111-CA01-Obtener lista de personajes exitosamente 200 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters'
    When method GET
    Then status 200
    And assert response.length > 0


  @id:2 @getCharacterByIdSolicitudExitosaCompleta200
  Scenario: T-API-TEST-111-CA02-Obtener personaje por ID exitosamente 200 completa
    * call read('crearPersonajeApi.feature@createCharacterCreateCharacterSolicitudExitosaCompleta')
    Given  url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/' + createdCharacterId
    When method GET
    Then status 200

  @id:3 @getCharacterByIdSolicitudExitosa200
  Scenario: T-API-TEST-111-CA02-Obtener personaje por ID exitosamente 200 completa
    Given  url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/1'
    When method GET
    Then status 200


  @id:4 @getCharacterByIdPersonajeNoEncontrado404
  Scenario: T-API-TEST-111-CA03-Obtener personaje por ID no encontrado 404 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/999'
    When method GET
    Then status 404
    And match response == { error: 'Character not found' }