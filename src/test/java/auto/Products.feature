Feature:
  Background:
    * configure headers = {'connection':'keep-alive', 'content-type':'application/json'}


  @GET_PRODUCTBYID
  Scenario:
    Given url baseUrl
    And path products+"/"+id
    When method get
    Then status 200

  @GET_PRODUCT
  Scenario:
    Given url baseUrl
    And path products
    When method get
    Then status 200

  @POST_PRODUCT
    Scenario:
      * def req = read('/product.json')
      Given url baseUrl
      And path products
      And request req
      When method post
      Then status 201



