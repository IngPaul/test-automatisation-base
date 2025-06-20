@REQ_TEST-111 @HU111 @get_characters
Feature: TEST-111 Obtener personajes de Marvel API

  Background:
    * def timestamp = function(){ return java.lang.System.currentTimeMillis() + '' }


  @id:1 @getCharacters @solicitudExitosa200
  Scenario: T-API-TEST-111-CA01-Obtener lista de personajes exitosamente 200 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method GET
    Then status 200
    And assert response.length > 0
#TODO enlazar
  @id:2 @getCharacterById @solicitudExitosa200
  Scenario: T-API-TEST-111-CA02-Obtener personaje por ID exitosamente 200 - karate
    * call read('crearPersonajeApi.feature@createCharacterSolicitudExitosa200')
    Given  url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/1'
    When method GET
    Then status 200
    And match response == { id: 1, name: 'Iron Man', alterego: 'Tony Stark', description: 'Genius billionaire', powers: ['Armor', 'Flight'] }


  @id:3 @getCharacterById @personajeNoEncontrado404
  Scenario: T-API-TEST-111-CA03-Obtener personaje por ID no encontrado 404 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    When method GET
    Then status 404
    And match response == { error: 'Character not found' }