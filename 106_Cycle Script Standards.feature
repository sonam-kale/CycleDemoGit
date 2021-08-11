###########################################################
# Copyright 2020, Tryon Solutions, Inc.
# All rights reserved.  Proprietary and confidential.
#
# This file is subject to the license terms found at 
# https://www.cycleautomation.com/end-user-license-agreement/
#
# The methods and techniques described herein are considered
# confidential and/or trade secrets. 
# No part of this file may be copied, modified, propagated,
# or distributed except as authorized by the license.
############################################################ 
# Utility: Terminal Navigation Utilities.feature
# 
# Functional Area: Terminal
# Author: Tryon Solutions
# Blue Yonder WMS Version: Consult Bundle Release Notes
# Test Case Type: Utility
# Blue Yonder Interfaces Interacted With: Terminal
#
# Description: Utility Scenarios that navigate to certain parts of the Terminal
#
# Public Scenarios:
#	- Terminal Navigate to Load Equipment Menu - From the Undirected Menu, navigates to the Load Equipment Menu
#	- Terminal Navigate Quickly to Undirected Menu - From most screens, navigate to the Undirected Menu
#	- Terminal Navigate to LTL Load Menu - From the Undirected Menu, navigates to the LTL Load Menu
#
# Assumptions:
# None
#
# Notes:
# None
#
############################################################
Feature: Terminal Navigation Utilities

@wip @public
Scenario: Terminal Navigate to Load Equipment Menu
#############################################################
# Description: From the Undirected Menu, navigate to the Load Equipment Menu
# MSQL Files:
#	None
# Inputs:
#	Required:
#		None
#	Optional:
#		None
# Outputs:
#	None
#############################################################

Given I "navigate to the Shipment Menu"
	Once I see "Undirected Menu" in terminal
	If I verify text $term_type is equal to "handheld"
		Once I see cursor at line 12 column 15 in terminal
	Else I verify text $term_type is equal to "vehicle"
		Once I see cursor at line 7 column 18 in terminal
	Endif
	When I type option for "Shipment Menu" menu in terminal

When I "navigate to the Load Equip screen"
	Once I see "Load Equip" in terminal
	If I verify text $term_type is equal to "handheld"
		Once I see cursor at line 12 column 15 in terminal
	Else I verify text $term_type is equal to "vehicle"
		Once I see cursor at line 7 column 18 in terminal
	Endif
	When I type option for "Load Equip" menu in terminal

Then I "validate we are on the Load Equip screen"
	Once I see "Stop:" in terminal
	If I verify text $term_type is equal to "handheld"
		Once I see cursor at line 4 column 1 in terminal
	Else I verify text $term_type is equal to "vehicle"
		Once I see cursor at line 3 column 20 in terminal
	Endif
	Then I execute scenario "Terminal Clear Field"

@wip @public
Scenario: Terminal Navigate Quickly to Undirected Menu
#############################################################
# Description: This will navigate to the Undirected Menu from most Terminal screens.
# If will bypass deposit and other checks and simply do the traversal home.
# MSQL Files:
#	None
# Inputs:
#	Required:
#		None
#	Optional:
#		None
# Outputs:
#	None
#############################################################

Given I assign 0 to variable "undir_loop_counter"
And I assign 50 to variable "undir_loop_max"
While I verify number $undir_loop_counter is less than or equal to $undir_loop_max
	Then I verify screen is done loading in terminal within $max_response seconds
	If I do not see "ndirected Menu" in terminal within $wait_short seconds 
		Given I press keys "F1" in terminal
		
		If I see "Logout" in terminal within $wait_short seconds 
		And I see "Y|N" in terminal
        	If I verify text $term_type is equal to "handheld"
				Once I see cursor at line 16 column 20 in terminal
			Else I verify text $term_type is equal to "vehicle"
				Once I see cursor at line 8 column 21 in terminal
            Endif
			Then I press keys "N" in terminal
		Endif
		
		If I see "Invalid" in terminal within $wait_short seconds 
		And I see "Enter" in terminal
	  		Once I press keys "ENTER" in terminal
	  		And I wait $wait_short seconds 
		Endif
	Else I increase variable "undir_loop_counter" by $undir_loop_max
	Endif
	Then I increase variable "undir_loop_counter" by 1
EndWhile

@wip @public
Scenario: Terminal Navigate to LTL Load Menu
#############################################################
# Description: From the Undirected Menu, navigate to the LTL Load Menu
# MSQL Files:
#	None
# Inputs:
#	Required:
#		None
#	Optional:
#		None
# Outputs:
#	None
#############################################################

Given I "navigate to the Shipment Menu"
	Once I see "Undirected Menu" in terminal
	If I verify text $term_type is equal to "handheld"
		Once I see cursor at line 12 column 15 in terminal
	Else I verify text $term_type is equal to "vehicle"
		Once I see cursor at line 7 column 18 in terminal
	Endif
	When I type option for "Shipment Menu" menu in terminal

When I "navigate to the LTL Loading Menu"
	Once I see "LTL Loading" in terminal
	If I verify text $term_type is equal to "handheld"
		Once I see cursor at line 12 column 15 in terminal
	Else I verify text $term_type is equal to "vehicle"
		Once I see cursor at line 7 column 18 in terminal
	Endif
	When I type option for "LTL Loading" menu in terminal

Then I "validate we are on the LTL Loading screen"
	Once I see "Dock:" in terminal
	If I verify text $term_type is equal to "handheld"
		Once I see cursor at line 4 column 1 in terminal
	Else I verify text $term_type is equal to "vehicle"
		Once I see cursor at line 3 column 10 in terminal
	Endif
	Then I execute scenario "Terminal Clear Field"


#############################################################
# Private Scenarios:
#   None
#############################################################