#mvn clean test "-Dkarate.options=--tags @Smoke" "-Dkarate.env=dev"
Feature:
  Background:
    * configure headers = {'connection':'keep-alive', 'content-type':'application/json'}
    * def KarateCache = Java.type('Util.KarateCache')
    * def karateCache = new KarateCache()
    * print hostname
   @Smoke
  Scenario Outline:
   * def arr = {"name":'<name>', "type":'<type>', "price":<price>,"manufaturer":'<manufacturer>',"model":'<model>'}
    * def res = call read(PRODUCT_FEATURE+'@POST_PRODUCT') arr
    * def id = res.response.id
     * print id
     * karateCache.add("id",id)


    Examples:
      | name                  | type      | price | manufacturer | model       |
      | Duracell - AA - Test2 | HardGood2 | 5.41  | Duracell2    | MN5214F1211 |


  @Smoke
  Scenario:
    * def id = 9999729
#    * def id = karateCache.get("id")
    * def res = call read(PRODUCT_FEATURE+'@GET_PRODUCT') {"id":'#(id)'}
    * karate.log(res.response)
    * def data = karate.jsonPath(res.response, "$.data[?(@.model=='MN2400B4Z')]")
    * print data


  @Smoke1
  Scenario:

    * def res = call read(PRODUCT_FEATURE+'@GET_PRODUCT')
    * def data = karate.jsonPath(res.response, "$.data[?(@.model=='MN2400B4Z')].categories[0].id")
    * print data

