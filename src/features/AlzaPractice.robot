*** Settings ***
Documentation     A test suite with one test case for complete automantion testing of given page.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../config.robot
Resource          ${KEYWORDS_FILE_PATH}
Resource          ${FLOWS_FILE_PATH}

Library          OperatingSystem

Suite Setup      Include Browser Drivers
Test Setup       Set Start Time
Test Teardown    Set and Evaluate Elapsed Time

*** Test Cases ***

#Alza Practice
#    [Tags]  Full-test
#    Alza Practice Flow    browser=${BROWSER}  page=${ALZA}
#                ...       timeouts=10s
#                ...       item=phone
#                ...       select_tab=Top-Rated
#                ...       item_quantity=1
#                ...       payment_charge=free
#                ...       delivery_place=AlzaBox
#                ...       payment_method=Credit / Debit Card
#                ...       delivery_method=Slovak Post
#                ...       delivery_address=Bratislava 37

#Alza2 Practice
#    [Tags]  Full-test
#    Alza2 Practice Flow   browser=${BROWSER}  page=${ALZA}
#                ...       timeouts=10s
#                ...       item=phone
#                ...       item_quantity=1
#
#Alza3 Practice
#    [Tags]  Full-test
#    Alza3 Practice Flow   browser=${BROWSER}  page=${ALZA}
#                ...       timeouts=10s
#                ...       item=phone
#                ...       item_quantity=1
#                ...       select_tab=Top-Rated
#
#Alza4 Practice
#    [Tags]  Full-test
#    Alza4 Practice Flow   browser=${BROWSER}  page=${ALZA}
#                ...       timeouts=10s
#
Alza5 Practice
    [Tags]  Full-test
    Alza5 Practice Flow  browser=${BROWSER}     page=${ALZA}
                ...      timeouts=10s
                ...      texttext=rosefield









