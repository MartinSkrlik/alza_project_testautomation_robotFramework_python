*** Settings ***
Documentation     A resource file with reusable xpaths and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.
#   List keywords files
Resource    common_keywords.robot
#Resource    custom_keywords.robot
Resource    ALZA_AlzaPracticeSteps.robot