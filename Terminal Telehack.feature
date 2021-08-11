################################################################
# Test Case: Terminal Telehack.feature
# Functional Area: Terminal
# Author:Sonam Gund kaaaallleeee
# Test Case Type: Regression
#
# Description: Verifying various actions can be performed on the Telehack website via a terminal
#
# Website:telehack.com
#
# Test Case Inputs: help_name,help_description
#
# Test Case Detail Input CSV:Telehack Inputs.csv
#
# Test Case Verification Approach:A successful test case will be verified by a complete run and by manually comparing the echoed variables against the screenshots taken by Cycle. 
#
##################################################################
Feature: Terminal Telehack

Background: 
#################################################################
# Description: Imports dependencies and variables declartion
#################################################################
Given I "Import dependencies "
	And I import scenarios from "Utilities\Terminal Telehack Workflow Utilities.feature"

When I "declare variables"
	Then I assign 12 to variable "maxWait"
    And I assign 7 to variable "minWait"
    
After Scenario: 
################################################################
# Description: End Process,Echo Results and Close terminal
################################################################
Given I "Echo Results and Close the Telehack terminal"
	Then I execute scenario "End Process and Echo Results "


@telehack
Scenario outline:Terminal Telehack Connection
CSV Examples: Dataset\TELEHACK-Input.csv
Given I "reading data from csv"
	Then I assign all chevron variables to dollar variables
    
And I "Connect to teminal"
	When I execute scenario "Connect to Terminal"
    
When I "Capture Zork description"
	When I execute scenario "Capture Zork description"

And I "Verify Rolls"
	When I execute scenario "Verify Rolls"

And I "Start Zork"
	When I execute scenario "Start Zork"

And I "Inside Zork Game "
	When I execute scenario "In the Zork House"

And I "Die by a Grue"
	When I execute scenario "Die by a Grue"

Then I "Quit game and Return to the Home Screen"
	And I execute scenario "Quit Game"
 

    
