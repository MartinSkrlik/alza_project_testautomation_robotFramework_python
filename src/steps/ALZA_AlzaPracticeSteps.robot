*** Settings ***
Documentation     A resource file with reusable keywords.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.
Library           SeleniumLibrary
Library           String
Library           Collections

Resource          ${CONFIG_FILE_PATH}
Resource          ${KEYWORDS_FILE_PATH}
Resource          ${POM_FILES_PATH}
*** Variables ***
${Count}=       ${0}
*** Keywords ***
Open and Maximize Browser
    [Arguments]    ${browser}
    Custom Tag  Open and Maximize Browser
    Open Browser    browser=${browser}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go to Webside
    [Arguments]     ${google}
    Custom Tag  Go to Webside
    Go To   ${google}

If PopUp Appears Then Close it
    Custom Tag  If PopUp Appears Then Close it
    ${value}=   Get Element Count      ${Understand_Pop_Up}
    Run Keyword If    ${value} > 0      Click Element       ${Understand_Pop_Up}
    Custom Screenshot   Page

Search for Item
    [Arguments]    ${item}      ${timeouts}
    Custom Tag      Search for Item
    Wait Until Element Is Visible   ${Search_input}     ${timeouts}
    Input Text      ${Search_input}     ${item}
    Textfield Value Should Be   ${Search_input}     ${item}
    Click Element   ${Search_button}

Select Tab
    [Arguments]     ${select_tab}     ${timeouts}
    Custom Tag      Select Tab
    Wait Until Element Is Visible   //a[contains(text(),'${select_tab}')]     ${timeouts}
    Click Element    //a[contains(text(),'${select_tab}')]
    Wait Until Page Contains Element    ${Loading_wheel}       ${timeouts}
    Element Should Be Visible    //li[@aria-selected='true']/a[contains(text(),'${select_tab}')]
    Custom Screenshot   Page

Remember Name of First Product
    [Arguments]     ${item_quantity}      ${timeouts}
    Custom Tag      Remember Name of First Product
    ${PRODUCT_NAME}=   Get Text    (//a[contains(@class,'name')])[${item_quantity}]
    Return From Keyword    ${PRODUCT_NAME}

Remember Price of First Product
    [Arguments]     ${item_quantity}     ${timeouts}
    Custom Tag      Remember Price of First Product
    ${PRODUCT_PRICE}=   Get Element Attribute    (//a[contains(@class,'name')])[${item_quantity}]
    ...     data-impression-metric2
    Return From Keyword    ${PRODUCT_PRICE}

Click Buy
    [Arguments]     ${item_quantity}    ${timeouts}
    Custom Tag      Click Buy
    Click Element   //a[@class='btnk1'][${item_quantity}]
    Wait Until Element Is Visible    ${Add_to_cart_button}      ${timeouts}
    Click Element   ${Add_to_cart_button}

Verify If Page Contains Text
    [Arguments]    ${added_to_cart_info}    ${timeouts}
    Custom Tag      Verify If Page Contains Text
    Wait Until Page Contains    ${added_to_cart_info}   ${timeouts}
    Custom Screenshot   Page

Verify If Product Model Name is Present on the Page
    [Arguments]     ${Product_name}
    Custom Tag      Verify If Product Model Name is Present on the Page
    Page Should Contain     ${Product_name}
    Custom Screenshot   Page

Click Proceed to Checkout
    [Arguments]     ${timeouts}
    Custom Tag      Click Proceed to Checkout
    Wait Until Element Is Visible       ${Proceed_to_checkout_button}      ${timeouts}
    Click Element   ${Proceed_to_checkout_button}

Verify If Cart Tab is Active
    [Arguments]     ${timeouts}
    Custom Tag      Verify If Cart Tab is Active
    Wait Until Page Contains Element     ${Cart_tab}      ${timeouts}
    Custom Screenshot   Page

Compare Price from Previous Page with Price on Current Page
    [Arguments]     ${Product_price}    ${timeouts}
    Custom Tag  Compare Price from Previous Page with Price on Current Page
    Wait Until Element Is Visible   ${Cart_paid_VAT}    ${timeouts}
    ${paid_for_item}=   Get Text    ${Cart_paid_VAT}
    ${total_price}=     Remove String    ${paid_for_item}   €   ${SPACE}
    ${total_price}=     Convert To Number   ${total_price}
    ${total_price}=     Evaluate   "%.2f" % ${total_price}
    Should Be Equal     ${total_price}      ${Product_price}

Verify If Payment Delivery Tab is Active
    [Arguments]     ${timeouts}
    Custom Tag  Verify If Payment Delivery Tab is Active
    Wait Until Page Contains Element     ${Payment_Tab}      ${timeouts}
    Custom Screenshot   Page

Select Delivery Method
    [Arguments]     ${delivery_method}    ${delivery_place}    ${delivery_address}    ${timeouts}
    Custom Tag      Select Delivery Method
    Click Element   //div[contains(text(),'${delivery_place}')]
#    sleep   3s
    ${main_shop}=   Get Element Count       ${Bratislava_mainshop_title}
    ${personal_pickup}=     Get Element Count       ${Bratislava_personal_title}
    Run Keyword If    ${main_shop} > 0      Confirm Main Shop Delivery Method
    ...     [Arguments]    ${delivery_method}   ${timeouts}
    Run Keyword If    ${personal_pickup} > 0      Confirm Personal Pick Up Delivery Method
    ...     [Arguments]    ${delivery_method}   ${delivery_address}   ${timeouts}

Confirm Main Shop Delivery Method
    [Arguments]    ${delivery_place}   ${delivery_method}  ${timeouts}
    Custom Tag      Confirm Main Shop Delivery Method
    Wait Until Element Is Visible     //*[contains(text(),'${delivery_method}')]      ${timeouts}
    Click Element     //*[contains(text(),'${delivery_method}')]
    Wait Until Page Contains Element    ${Confirm_your_select_button}      ${timeouts}
    Click Element       ${Confirm_your_select_button}
    Wait Until Page Contains Element     ${Credit_debit_checkbox}      ${timeouts}
    Checkbox Should Be Selected     ${Delivery_checkbox_checked}

Confirm Personal Pick Up Delivery Method
    [Arguments]     ${delivery_place}       ${delivery_method}      ${delivery_address}      ${timeouts}
    Custom Tag      Confirm Personal Pick Up Delivery Method
    Wait Until Element Is Enabled     //*[contains(text(),'${delivery_method}')]      ${timeouts}
    Click Element       //*[contains(text(),'${delivery_method}')]
    Wait Until Element Is Enabled    //*[contains(text(),'${delivery_address}')]     ${timeouts}
    Click Element       //*[contains(text(),'${delivery_address}')]
    Wait Until Element Is Enabled       ${Pick_up_here_button}      ${timeouts}
    Click Element    ${Pick_up_here_button}
    Wait Until Page Contains Element     ${Credit_debit_checkbox}      ${timeouts}
    Checkbox Should Be Selected     ${Delivery_checkbox_checked}

Remember Dispatch Price
    [Arguments]    ${timeouts}
    Custom Tag  Remember Dispatch Price
    Wait Until Element Is Visible   ${Credit_debit_checkbox}  ${timeouts}
    ${DISPATCH_PRICE}=   Get Text   ${Checkbox_dispatch_price}
    Return From Keyword     ${DISPATCH_PRICE}

Select Checkbox Credit Debit Card
    [Arguments]    ${timeouts}
    Custom Tag      Select Checkbox Credit Debit Card
    Wait Until Element Is Visible       ${Credit_debit_checkbox}      ${timeouts}
    Click Element       ${Credit_debit_checkbox}

Verify If Price of Dispatch is Visible on the Page
    [Arguments]    ${Dispatch_price}
    Custom Tag      Verify If Price of Dispatch is Visible on the Page
    Element Text Should Be    ${Disp_price}     ${Dispatch_price}
    Custom Screenshot   Page

Verify If Payment is for free
    [Arguments]     ${payment_charge}    ${timeouts}
    Custom Tag      Verify If Payment is for free
    Wait Until Element Is Visible       ${Payment_charge_info}       ${timeouts}
    Element Text Should Be      ${Payment_charge_info}       ${payment_charge}
    Custom Screenshot   Page

Click Continue Button
    [Arguments]    ${timeouts}
    Custom Tag      Click Continue Button
    Wait Until Element Is Visible    ${Continue_button}    ${timeouts}
    Click Element   ${Continue_button}

Verify If Address Tab is Active
    [Arguments]     ${timeouts}
    Custom Tag      Verify If Address Tab Is Active
    Wait Until Page Contains Element    ${Address_tab}      ${timeouts}
    Custom Screenshot   Page

Verify If Product Price is Present on the Page
    [Arguments]    ${Product_price}     ${timeouts}
    Custom Tag      Verify If Product Price is Present on the Page
    ${Product_price}=     Evaluate   "%.0f" % ${Product_price}
    Page Should Contain     ${Product_price}
    Custom Screenshot   Page

Verify If Delivery Method is Visible on the Page
    [Arguments]     ${delivery_address}
    Custom Tag      Verify If Delivery Method is Visible on the Page
    Page Should Contain     ${delivery_address}
    Custom Screenshot   Page

Verify If Payment Method is Credit-Debit Card
    [Arguments]     ${payment_method}
    Custom Tag      Verify If Payment Method is Credit-Debit Card
    Element Text Should Be    ${Payment_method_info}     ${payment_method}
    Custom Screenshot   Page

Verify If Total Price is Correct
    [Arguments]    ${Product_price}    ${Dispatch_price}
    Custom Tag      Verify If Total Price is Correct
    ${Total_price}=    Get Text    ${Summary_price_to_pay}
    ${Total_price}=    Remove String    ${Total_price}   €   ${SPACE}
    ${Total_price}=    Convert To Number    ${Total_price}
    ${Dispatch_price}=    Remove String    ${Dispatch_price}   €   ${SPACE}
    ${Dispatch_price}=    Convert To Number    ${Dispatch_price}
    ${Product_price}=   Convert To Number       ${Product_price}
    ${ProAndDispPrice}=     Evaluate    ${Product_price} + ${Dispatch_price}
    Should Be Equal     ${Total_price}      ${ProAndDispPrice}

#Find Specific Model
#    [Arguments]   ${model_name}     ${timeouts}
#    Custom Tag      Find Specific Model
#    ${look_for_item}=    Run Keyword And Return Status     Page Should Contain     ${model_name}
#    WHILE    '${look_for_item}' == 'False'
#        Wait Until Element Is Visible   ${Next_page_button}    ${timeouts}
#        Click Element       ${Next_page_button}
#        Wait Until Element Is Not Visible    ${Loading_wheel}
#        ${look_for_item}=   Run Keyword And Return Status    Page Should Contain    ${model_name}
#    END

Remember Product Details of First Product
    [Arguments]    ${item_quantity}    ${timeouts}
    Custom Tag      Remember Product Details of First Product
    ${model_details}=     Get Text
    ...     (//a[@data-impression-position='${item_quantity}'])[2]/following-sibling::div
    Return From Keyword    ${model_details}

Select First Product
    [Arguments]    ${item_quantity}
    Custom Tag      Select First Product
    Click Element       (//a[contains(@class,'name')])[${item_quantity}]

Compare Product Details with Details from Previous Page
    [Arguments]    ${Product_details}    ${timeouts}
    Custom Tag      Compare Product Details with Details from Previous Page
    Wait Until Page Contains    ${Product_details}   ${timeouts}
    Element Text Should Be    ${Product_review_details}     ${Product_details}
    Custom Screenshot   Page

Add Product to Favourites
    [Arguments]    ${Product_name}    ${timeouts}
    Custom Tag      Add Product to Favourites
    Wait Until Page Contains    ${Product_name}   ${timeouts}
    Click Element    ${Add_to_list_button}
    Click Element    ${Add_to_list_button}
    Reload Page
    Wait Until Element Is Visible    ${Heart_icon}      ${timeouts}
    Custom Screenshot   Page
    Click Element    ${Heart_icon}

Check Product Price in Favourite Tab
    [Arguments]     ${Product_price}    ${timeouts}
    Custom Tag  Check Product Price in Favourite Tab
    Wait Until Element Is Visible    ${Product_price_favourite_tab}     ${timeouts}
    ${price}=   Get Text    ${Product_price_favourite_tab}
    ${price}=    Remove String      ${price}    €   ${SPACE}
    ${price}=     Evaluate   "%.2f" % ${price}
    Should Be Equal    ${price}     ${Product_price}
    Custom Screenshot   Page

Check Product Name in Favourite Tab
    [Arguments]    ${Product_name}     ${timeouts}
    Custom Tag  Check Product Name in Favourite Tab
    Wait Until Element Is Visible    ${Product_name_favourite_tab}      ${timeouts}
    ${name}=    Get Text    ${Product_name_favourite_tab}
    Should Be Equal    ${name}      ${Product_name}
    Custom Screenshot   Page

Open Cart
    [Arguments]    ${timeouts}
    Custom Tag  Open Cart
    Wait Until Element Is Visible   ${Cart_button}      ${timeouts}
    Click Element   ${Cart_button}

Add 3 Product to Cart
    [Arguments]    ${timeouts}
    Custom Tag  Add 3 Product To Cart
    Custom Screenshot   Page
    FOR    ${product_name}    IN    Nokia   Samsung     Xiaomi      Apple
        Wait Until Element Is Visible   ${Add_more_product_button}     ${timeouts}
        Click Element    ${Add_more_product_button}
        Wait Until Element Is Visible   ${Add_more_product_txtfield}    ${timeouts}
        Input Text      ${Add_more_product_txtfield}    ${product_name}
        Wait Until Element Is Visible    ${Autocomplete_menu}   ${timeouts}
        Click Element    ${Select_first_product}
        Wait Until Element Is Not Visible    ${Add_more_product_txtfield}       ${timeouts}
    END
    Custom Screenshot   Page

#Remember All Prices and Names
#    Custom Tag  Remember All Prices and Names
#    @{List_of_prices}=      Create List
#    @{List_of_names}=      Create List
#    &{Dict_info_of_products}      Create Dictionary    a=${List_of_prices}    b=${List_of_names}
#    @{All_prices}       Get Webelements      ${All_product_prices_in_cart}
#    FOR    ${product_price}     IN      @{All_prices}
#        ${price_txt}=     Get Text    ${product_price}
#        Append To List      ${List_of_prices}    ${price_txt}
#    END
#    @{All_names}       Get Webelements      ${All_product_names_in_cart}
#    FOR    ${product_name}     IN      @{All_names}
#        ${name_txt}=     Get Text    ${product_name}
#        Append To List      ${List_of_names}    ${name_txt}
#    END
#    Return From Keyword     &{Dict_info_of_products}

Remember All Prices and Names
    Custom Tag  Remember All Prices and Names
    @{List_of_prices}=      Create List
    @{List_of_names}=       Create List
    &{Dict_info_of_products}      Create Dictionary    a=${List_of_prices}    b=${List_of_names}
    @{All_prices}       Get Webelements      ${All_product_prices_in_cart}
    @{All_names}       Get Webelements      ${All_product_names_in_cart}
    FOR    ${product_price}     IN      @{All_prices}
        ${price_txt}=     Get Text    ${product_price}
        Append To List      ${List_of_prices}    ${price_txt}
        FOR    ${product_name}     IN      @{All_names}
            ${name_txt}=     Get Text    ${product_name}
            Append To List      ${List_of_names}    ${name_txt}
        END
    END
    Return From Keyword     &{Dict_info_of_products}
    Log To Console    ${Dict_info_of_products}

Remove Last Added Product from Cart
    [Arguments]    ${timeouts}
    Custom Tag  Remove Last Added Product from Cart
    ${Products_count}=   Get Text    ${Basket_count}
    ${Products_count}=   Convert To Integer     ${Products_count}
    Wait Until Element Is Visible
    ...     (//span[contains(@class,'item-options-trigger')])[${Products_count}]   ${timeouts}
    Click Element       (//span[contains(@class,'item-options-trigger')])[${Products_count}]
    Wait Until Element Is Visible
    ...     (//span[contains(@class,'item-options-trigger')])[${Basket_count}]//following-sibling::div//li  ${timeouts}
    Click Element    (//span[contains(@class,'item-options-trigger')])[${Basket_count}]//following-sibling::div//li
    Return From Keyword     ${Products_count}

Verify If Product was Removed
    [Arguments]    ${Products_count}    ${timeouts}
    Custom Tag      Verify If Product was Removed
    Wait Until Page Contains Element    ${Loading_wheel}   ${timeouts}
    ${Element_count}=   Get Text    ${Basket_count}
    ${Element_count}=   Convert To Integer  ${Element_count}
    Should Be Equal     ${Element_count}    ${Products_count-1}
    Custom Screenshot   Page

Verify If the Rest Product Prices not Changed
    [Arguments]     &{Dict_info_of_products}
    Custom Tag      Verify If the Rest Product Prices not Changed
    @{All_prices}       Get Webelements      ${All_product_prices_in_cart}
    FOR    ${product_price}     IN      @{All_prices}
        ${price_txt}=     Get Text    ${product_price}
        Should Be Equal    ${price_txt}     ${Dict_info_of_products.a}[${Count}]
        ${Count}=    set variable      ${Count+1}
    END

Verify If the Rest Product Names not Changed
    [Arguments]     &{Dict_info_of_products}
    Custom Tag      Verify If the Rest Product Names not Changed
    @{All_names}       Get Webelements      ${All_product_names_in_cart}
    FOR    ${product_name}     IN      @{All_names}
        ${name_txt}=     Get Text    ${product_name}
        Should Be Equal    ${name_txt}     ${Dict_info_of_products.b}[${Count}]
        ${Count}=    set variable      ${Count+1}
    END

Set text into textfield
    [Arguments]    ${timeouts}  ${texttext}
    Custom Tag    Set text into textfield
    Wait Until Page Contains Element    ${textfield2}   ${timeouts}
    Input Text    ${textfield2}     ${texttext}
    Textfield Value Should Be   ${textfield2}   ${texttext}
    Click Element   ${buttonsearch2}
