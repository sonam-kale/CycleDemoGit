Feature: My Feature



Background: 
Given I assign 20 to variable "number1"
and I assign 30 to variable "number2"
and I assign """"CAT4 Training"""" to variable "str1"


@multiplication
Scenario: Doing Muliplication
Given I import scenarios from "Utilities/CAT4_TC Utiities.feature"
And I execute scenario "Multiplication of Numbers"


@terminal
Scenario: Terminal testing
Given I open terminal connected to "telehack.com" sized to 24 lines and 76 columns
And I wait 5 seconds
And i enter "roll" in terminal
And I wait 10 seconds
And I copy terminal line 7 columns 6 through 6 to variable "number"
Then I echo $number
And i enter "zork" in terminal
And I wait 10 seconds
    When  I locate "Release" in terminal
      Then I copy terminal line $terminal_line columns $terminal_column through 11 to variable "zork_release"
      And I echo $zork_release
      
   

















@login
Scenario:Login to System
Given I "Login to system"
And I echo "Login here"

@addition
Scenario: Addition of Numbers
Given I "Test scenarion"
And I echo "I am doing addtion here"
#And I increase variable "<VARIABLE_NAME>" by <NUMBER>
And I execute Groovy "Res=number1+number2"
And I echo $Res

@comapre
Scenario:Compare Variables
If i verify number $number1 is greater than or equal to $number2
	then I echo "Number1 is greater"
Else I echo "Number1 is less"
EndIf


While I verify number $number1 is less than 25
	then i increase variable "number1" by 1
    And I echo $number1
EndWhile



















@outline
Scenario Outline: Scenario Outline Name
CSV Examples: Dataset/cat4.csv
If i verify number <number1> is greater than or equal to <number2>
	then I echo "Number1 is greater"
Else I echo "Number1 is less"
EndIf
And I assign all chevron variables to dollar variables

@access
Scenario: Access outine variables 
Given I execute scenario "Scenario Outline Name"
And I echo $number1
And I echo $str1

@write
Scenario:Write data to file
If I verify file "Dataset/CATWrite4.csv" does not exist
	Given I create file "Dataset/CATWrite4.csv" with contents "Name,Address"
EndIf

Then I append "Sonam,Pune" to end of file "Dataset/CATWrite4.csv"
And I append "Ajay,HYD" to end of file "Dataset/CATWrite4.csv"

And I create file "Dataset/CATWrite41.csv"
And I append "Cat Training" to end of file "Dataset/CATWrite41.csv"
And I replace "Sonam" with "Gund" in file "Dataset/CATWrite4.csv"
#And I copy file "Dataset/CATWrite4.csv" to "Dataset/CATWrite412.csv"
#And I delete file "Dataset/CATWrite4.csv"



@list
Scenario: List
Given I create list "Book"
And I append element "Java" to list "Book"
And I append element "Python" to list "Book"
And I Prepend element "RUby" to list "Book"

Then I echo $Book
And I verify list "<LIST_NAME>" contains "<LIST_ELEMENT>"


@web
Scenario:Web Testing
Given I open "Chrome" web browser
Then I navigate to "https://money.rediff.com/gainers/bse/daily/groupa?src=gain_lose" in web browser within 10 seconds
And I maximize web browser
Then I copy value in row "3" column "4" in table "xPath://table[@class='dataTable']" in web browser as variable "price"
And I echo $price
#And I hover mouse over element "<id|tag|className|cssSelector|text|xPath|linkText|name>:<ELEMENT_NAME>" in web browser


ANd I switch to tab "<TAB_NUMBER>" in web browser

And I close web browser
And I click ok on javascript modal
And I click cancel on javascript modal







