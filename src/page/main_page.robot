*** Settings ***
Documentation     A resource file with reusable xpaths and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.

*** Variables ***

${Username_input} =     //input[@id='user-name']
${Password_input} =     //input[@id='password']
${Login_button} =       //input[@id='login-button']
${Page_title} =         //span[@class='title']
${Error_message} =      //h3[@data-test="error"]