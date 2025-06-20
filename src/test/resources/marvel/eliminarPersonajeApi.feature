@REQ_TEST-111 @HU111 @Agente2
Feature: TEST-111 Eliminar personajes de Marvel API

Background:
  * def timestamp = function(){ return java.lang.System.currentTimeMillis() + '' }

  @id:1 @deleteCharacter @solicitudExitosa204
  Scenario: T-API-TEST-111-CA01-Eliminar personaje exitosamente 204 - karate
    * call read('crearPersonajeApi.feature@createCharacterSolicitudExitosa200')
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/paul/api/characters/' + createdCharacterId
    When method DELETE
    Then status 204

    
  @id:2 @deleteCharacter @personajeNoEncontrado404
  Scenario: T-API-TEST-111-CA10-Eliminar personaje no encontrado 404 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/paul/api/characters/999'
    When method DELETE
    Then status 404
    And match response.error == 'Character not found'