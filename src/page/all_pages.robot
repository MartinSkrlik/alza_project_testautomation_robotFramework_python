*** Settings ***
Documentation     A resource file with reusable xpaths and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.
#   List POM files
#Resource    main_page.robot
Resource    ALZA_AlzaPracticePage.robot
