*** Settings ***
Documentation     A resource file with reusable keywords.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.
Library           SeleniumLibrary
Library           Screenshot
Library           DateTime

*** Keywords ***

Custom Screenshot
    [Arguments]     ${type_of_screenshot}     ${locator_of_element}=NONE
    
    ######################################## USE THIS TO TAKE SCREENSHOTS ####################################
    #${type_of_screenshot} = Type of element to screenshot - valid values = 'Page' 'Element' 'Alert'
    #${locator_of_element} = NONE as default, requiered to specify as parameter when Element type is selected
    
    Timestamp Handler Screenshot
    ${type_is_page}=  Run Keyword And Return Status    Should Be Equal   ${type_of_screenshot}     Page
    Run Keyword If     ${type_is_page}    Capture Page Screenshot     ${TIMESTAMP}_page_screenshot.png
    
    ${type_is_element}=  Run Keyword And Return Status    Should Be Equal   ${type_of_screenshot}     Element
    Run Keyword If     ${type_Is_element}    Capture Element Screenshot     ${locator_Of_Element}  ${TIMESTAMP}_element_screenshot.png  #${FOLDER_TIMESTAMP}_SCREENSHOTS_${SUITE NAME}/
    
    ${type_Is_alert}=  Run Keyword And Return Status    Should Be Equal   ${type_of_screenshot}     Alert
    Run Keyword If     ${type_Is_alert}    Take Screenshot             ${TIMESTAMP}_alert_screenshot
    
Timestamp Handler Screenshot
    ${TIMESTAMP}=   Get Current Date  result_format=%Y-%m-%d_%H-%M-%S-%f
    Set Global Variable     ${TIMESTAMP}
    
Timestamp Handler Output
    ${TIMESTAMP}=   Get Current Date  result_format=%H:%M:%S.%f
    Set Global Variable     ${TIMESTAMP}

Custom Tag  
    #[10:33:39,180]:-----------------------------------
    #[10:33:39,180]:Getting Environment
    #[10:33:39,180]:-----------------------------------
    
    # Generates Timestamps like above. Use at the start of keyword.
    #${module_name} = Name of keyword this module is called in.
    [Arguments]     ${module_name}
    
    Timestamp Handler Output
    Log To Console     \n[${TIMESTAMP}]:---------------------------------------------------------
    Timestamp Handler Output
    Log To Console     [${TIMESTAMP}]:${module_name}
    Timestamp Handler Output
    Log To Console     [${TIMESTAMP}]:---------------------------------------------------------
    
Set Start Time
    ${START_TIMESTAMP}=   Get Current Date  result_format=%H:%M:%S.%f
    Set Global Variable     ${START_TIMESTAMP}
    ${FOLDER_TIMESTAMP}=   Get Current Date  result_format=%Y-%m-%d_%H-%M-%S-%f
    Set Global Variable     ${FOLDER_TIMESTAMP}
    
Set and Evaluate Elapsed Time
    #Will print Elapsed Time of test case.
    #Use at the end of last keyword
    Custom Screenshot    Page
    ${END_TIMESTAMP}=   Get Current Date  result_format=%H:%M:%S.%f
    ${elapsed_time}=     Subtract Time From Time     ${END_TIMESTAMP}  ${START_TIMESTAMP}   timer
    Log To Console  \n\nTotal Elapsed Time:${elapsed_time}\n