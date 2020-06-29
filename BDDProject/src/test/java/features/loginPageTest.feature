#Author: your.email@your.domain.com  ______________________________
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template sample text# this page
@tag1
Feature: Loing test for newtorus web, for exercise 
  This is to test the newtorus login page functionality with different credencials

  Background: 
    #Transfering data without keywords use ""
    Given I am in newtours home page "http://www.newtours.demoaut.com/"

  @tag2 @systest
  Scenario: Login test weith correct credencials 
    When I insert user name="a" and password="a"
    And I press Login button
    Then "SIGN-OFF" link should be seen on the top menue

  @tag1 @tag2
  Scenario: login not success with incorrect username abced and pass ab
    When I insert user name "abcd" and password "ab"
    And i press login
    Then "SIGN-ON" link shoudl be seen
@systemTest @inteTest
  Scenario: test gmail page
    Givne I am on gmail home page "http://www.gmail.com"

    When I insert Username ="xxxxx@gmail.com"
    And I insert password ="xxxxx"
    And Press loing button
    Then I should get login success

  @tag1 @systest @inteTest
  Scenario Outline: Login test with different credencials
    When I insert user name="<userName>" and password="<password>"
    And I press Login button
    Then "<link>" link should be seen on the top menue

    # Transfering data with keywords transfring data with keywords
    Examples: 
      | userName | password | link     |
      | a        | a        | SIGN-OFF |
      | a        | bbb      | SIGN-ON  |
      | bbb      | a        | SIGN-ON  |
      | bbbc     | bbbc     | SIGN-ON  |
      |          | a        | SIGN-ON  |
      | a        |          | SIGN-ON  |
      |          |          | SIGN-ON  |
  
  Scenario: registraoin test 
  * I am on newtours reg page
  * I type corect info ofr userName="solomo" age29, address='dfsdfsfsd" 
  * press submit button
  * I should get reg success    
