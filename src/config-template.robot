*** Settings ***
Documentation     A resource file with reusable xpaths and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.

# COPY THIS FILE AND RENAME TO CONFIG.ROBOT

*** Variables ***
#   Global Variable with site you want to test. (URL site)
#   Feel free to add more URL sites
${SERVER}                https://www.saucedemo.com/
${GOOGLE_EXAMPLE}        https://www.google.com/

#   Customize speed of selenium (integer) . 
#   Details here https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Set%20Selenium%20Speed
${DELAY}                    0

#   Browser running test cases. (Firefox, Chrome, Edge, Opera, ......)
#   Details here https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser
${BROWSER}                  Edge


#   Path to keyword file.  
${KEYWORDS_FILE_PATH}           ../steps/all_keywords.robot

#   Path to POM file.
${POM_FILES_PATH}               ../page/all_pages.robot

#   Path to webdrivers directory
${WEB_DRIVERS_PATH}             ${EXECDIR}/web_drivers/

#   Path to config file (this file)
${CONFIG_FILE_PATH}             ../config.robot

#   Path to file with Flows
${FLOWS_FILE_PATH}              ../flows/flows.robot

*** Keywords ***
#   Append path to drivers to Enviromental variable PATH
Include Browser Drivers
    Append To Environment Variable    PATH    ${WEB_DRIVERS_PATH}