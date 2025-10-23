*** Settings ***
#resource file with reusable keywords.
#...
#...               The system specific keywords created here form our own
#...               domain specific language. They utilize keywords provided
#...               by the imported SeleniumLibrary and Screenshot.
Library           SeleniumLibrary

Resource          ${CONFIG_FILE_PATH}
Resource          ${KEYWORDS_FILE_PATH}
Resource          ${POM_FILES_PATH}

*** Keywords ***
Login with valid credentials - positive Flow
   [Arguments]    ${browser}  ${page}  ${username}    ${password}
   Open and Maximize Browser   ${browser}
   Go To Website               ${page}
   Login user with username and password   ${username}   ${password}
   Verify page title is visible    Products
   Close Browser

Login with lock-outed user - negative Flow
   [Arguments]    ${browser}  ${page}  ${username}    ${password}
   Open and Maximize Browser   ${browser}
   Go To Website               ${page}
   Login user with username and password   ${username}   ${password}
   Verify page title is not visible
   Verify error message is visible
   Close Browser

Alza Practice Flow
    [Arguments]     ${browser}      ${page}     ${timeouts}     ${item}     ${item_quantity}
        ...     ${payment_charge}    ${delivery_place}     ${payment_method}    ${select_tab}
        ...     ${delivery_method}       ${delivery_address}

    Open and Maximize Browser   ${browser}
    Go to Webside   ${page}
    If PopUp Appears Then Close it
    Search for Item    ${item}     ${timeouts}
    Select Tab   ${select_tab}    ${timeouts}
    ${Product_name}=    Remember Name of First Product      ${item_quantity}    ${timeouts}
    ${Product_price}=    Remember Price of First Product      ${item_quantity}     ${timeouts}
    Click Buy   ${item_quantity}   ${timeouts}
    Verify If Page Contains Text   Product Added to Cart.   ${timeouts}
    Verify If Product Model Name is Present on the Page     ${Product_name}
    Click Proceed to Checkout   ${timeouts}
    Verify If Cart Tab is Active     ${timeouts}
    Verify If Product Model Name is Present on the Page     ${Product_name}
    Compare Price from Previous Page with Price on Current Page     ${Product_price}    ${timeouts}
    Click Continue button   ${timeouts}
    Verify If Payment Delivery Tab is Active   ${timeouts}
    Verify If Product Model Name is Present on the Page     ${Product_name}
    Select Delivery Method      ${delivery_method}     ${delivery_place}     ${delivery_address}     ${timeouts}
    ${Dispatch_price}=     Remember Dispatch Price  ${timeouts}
    Verify If Payment Delivery Tab is Active     ${timeouts}
    Verify If Product Model Name is Present on the Page     ${Product_name}
    Verify If Price of Dispatch is Visible on the Page      ${Dispatch_price}
    Select Checkbox Credit Debit Card     ${timeouts}
    Verify If Payment is for free   ${payment_charge}   ${timeouts}
    Click Continue button   ${timeouts}
    Verify If Address Tab is Active      ${timeouts}
    Verify If Product Price is Present on the Page      ${Product_price}    ${timeouts}
    Verify If Delivery Method is Visible on the Page    ${delivery_address}
    Verify If Price of Dispatch is Visible on the Page      ${Dispatch_price}
    Verify If Payment Method is Credit-Debit Card     ${payment_method}
    Verify If Payment is for free   ${payment_charge}   ${timeouts}
    Verify If Total Price is Correct    ${Product_price}    ${Dispatch_price}
    Close Browser

Alza2 Practice Flow
    [Arguments]    ${browser}   ${page}     ${item}     ${timeouts}     ${item_quantity}
    Open and Maximize Browser   ${browser}
    Go to Webside   ${page}
    If PopUp Appears Then Close it
    Search for Item    ${item}     ${timeouts}
    ${Product_details}=     Remember Product Details of First Product       ${item_quantity}    ${timeouts}
    Select First Product    ${item_quantity}
    Compare Product Details with Details from Previous Page   ${Product_details}   ${timeouts}
    Close Browser

Alza3 Practice Flow
    [Arguments]     ${browser}   ${page}     ${item}     ${timeouts}    ${select_tab}   ${item_quantity}
    Open and Maximize Browser   ${browser}
    Go to Webside   ${page}
    If PopUp Appears Then Close it
    Search for Item    ${item}     ${timeouts}
    Select Tab   ${select_tab}    ${timeouts}
    ${Product_name}=    Remember Name of First Product      ${item_quantity}    ${timeouts}
    ${Product_price}=    Remember Price of First Product      ${item_quantity}     ${timeouts}
    Select First Product    ${item_quantity}
    Add Product to Favourites   ${Product_name}   ${timeouts}
    Check Product Price in Favourite Tab    ${Product_price}    ${timeouts}
    Check Product Name in Favourite Tab   ${Product_name}   ${timeouts}c
    Close Browser

Alza4 Practice Flow
    [Arguments]    ${browser}   ${page}     ${timeouts}
    Open and Maximize Browser   ${browser}
    Go to Webside   ${page}
    If PopUp Appears Then Close it
    Open Cart   ${timeouts}
    Add 3 Product to Cart   ${timeouts}
    &{Dict_info_of_products}=       Remember All Prices and Names
    ${Products_count}=      Remove Last Added Product from Cart     ${timeouts}
    Verify If Product was Removed   ${Products_count}   ${timeouts}
    Verify If the Rest Product Names not Changed   &{Dict_info_of_products}
    Verify If the Rest Product Prices not Changed   &{Dict_info_of_products}
    Close Browser
#    //df?sdf

Alza5 Practice Flow
    [Arguments]    ${browser}   ${page}     ${timeouts}     ${item_name}
    Open and Maximize Browser   ${browser}
    Go to Webside   ${page}
    Close popup cokies
    Put text into textfield and pick item   ${item_name}    ${timeouts}
#    /?/ddd
    Close Browser