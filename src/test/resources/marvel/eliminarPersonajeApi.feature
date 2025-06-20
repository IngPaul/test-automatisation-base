@REQ_TEST-111 @HU111 @Agente2
Feature: TEST-111 Eliminar personajes de Marvel API

  Background:
    * def randomNumber = function(){ return java.util.concurrent.ThreadLocalRandom.current().nextInt(0, 100000) + '' }
    * def value = randomNumber()
    * print 'Valor aleatorio:', value
    * def username = "paul11111"
    * print 'Username:', username

  @id:1 @deleteCharacterSolicitudRemoveExitosaCompleta204
  Scenario: T-API-TEST-111-CA01-Eliminar personaje exitosamente completa 204
    * call read('crearPersonajeApi.feature@createCharacterCreateCharacterSolicitudExitosaCompleta')
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/' + createdCharacterId
    When method DELETE
    Then status 204

  @id:2 @deleteCharacterSolicitudRemoveExitosa204
  Scenario: T-API-TEST-111-CA01-Eliminar personaje exitosamente depende de base 204
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/1'
    When method DELETE
    Then status 204

  @id:3 @deleteCharacterPersonajeNoEncontrado404
  Scenario: T-API-TEST-111-CA10-Eliminar personaje no encontrado 404
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/' + username + '/api/characters/999'
    When method DELETE
    Then status 404
    And match response.error == 'Character not found'