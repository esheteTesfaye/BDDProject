Feature: Testing registriaon page with different values
  As acompany our customers should register only if they put
  password and confirm password correclty
  The requirement says password must be > 6 char,
  and at least 1 upperl, 1 number, 1 sepecial character and no space
  so that we can refer them easi, password and confirm password

  Background: 
    Given your are in registraion page "http://newtours.demoaut.com/mercuryregister.php"
    And Add correct data to registration form 5
      # transfering data using data table
      | firstName | lastName | phone      | email                   | address   | city    | state | postalCode | userName |
      | Solomon   | Habut    | 3017929864 | ayanwsolomon1@gmail.com | Locust st | Herndon | VA    |      20171 | sol      |
      | Solomon   | Habut    | 3017929864 | ayanwsolomon1@gmail.com | Locust st | Herndon | VA    |      20171 | sol      |
      | abc   | jay    | 2344 | ddsfds@gmail.com | Locust st | Herndon | VA    |      20171 | sol      |
      | Solomon   | Habut    | 3017929864 | ayanwsolomon1@gmail.com | Locust st | Herndon | VA    |      20171 | sol      |
      | Solomon   | Habut    | 3017929864 | ayanwsolomon1@gmail.com | Locust st | Herndon | VA    |      20171 | sol      |
    
  Scenario Outline: Check registraion with correct and incorrect password and confirm password field
    When I insert password "<password>" and confirm password  "<confirm>"
    And I click submit
    Then "<url>" page should be seen

    # transfering data using examples Keywords comment is changed
    Examples: 
      | password               | confirm                | url                        |
      | solomonA1#             | solomonA1#             | create_account_success.php |
      | vwrwerwervwrwerQRTRE1$ | vwrwerwervwrwerQRTRE1$ | create_account_success.php |
      | solomonA1              | solomonA1              | mercuryregister.php        |
      | solomonA#              | solomonA#              | mercuryregister.php        |
      | solomon1#              | solomon1#              | mercuryregister.php        |
      | so1A#                  | so1A#                  | mercuryregister.php        |
      | solomonA1#             | selemenA1#             | mercuryregister.php        |
      |                        | solomonA1#             | mercuryregister.php        |
      | solomonA1#             |                        | mercuryregister.php        |
      |                        |                        | mercuryregister.php        |
      | solomon A1#            | solomon A1#            | mercuryregister.php        |
      