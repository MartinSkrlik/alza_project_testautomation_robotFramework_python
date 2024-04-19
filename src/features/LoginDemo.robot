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
Login with valid credentials - positive
    [Tags]  Positive
    Login with valid credentials - positive Flow  browser=${BROWSER}  page=${SERVER}
                                        ...       username=standard_user  password=secret_sauce

Login with lock-outed user - negative
    [Tags]  Negative
    Login with lock-outed user - negative Flow  browser=${BROWSER}  page=${SERVER}
                                        ...     username=locked_out_user  password=secret_sauce