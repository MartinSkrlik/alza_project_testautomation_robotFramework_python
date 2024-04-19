*** Settings ***
Documentation     A resource file with reusable xpaths and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.


*** Variables ***
#Alza  MainPage
${Understand_Pop_Up}                //*[text()='I understand']
${Search_input}                     //input[@id='edtSearch']
${TopRated_tab}                     //*[@aria-controls='nejlepehodnocene']
${Search_button}                    //div[@id='btnSearch']
${Add_to_cart_button}               //span[contains(text(),'Add')]
${Loading_wheel}                    //span[@style='display: none;']
${Proceed_to_checkout_button}       //a[@id='varBToBasketButton']
${Next_page_button}                 //a[contains(@class,'button-more')]
${Heart_icon}                       //div[@class='shoppingListIcons']
${Cart_button}                      //a[@id='basketLink']

#Alza2  Model Review Page
${Product_review_name}              //h1[@itemprop='name']
${Product_review_details}           //div[@id='detailText']//span
${Product_review_price}             //span[contains(@class,'price-text')]/span

#Alza3 Favourite Tab
${Add_to_list_button}               //span[@class='shoppingListsAdd']
${Product_name_favourite_tab}       //a[@class='name']
${Product_price_favourite_tab}      //span[@class='price']

#Alza  Cart Tab
${Cart_paid_VAT}                    //div[@id='sumc']//span[contains(@class,'price')]
${Continue_button}                  //a[contains(@class,'green')]
${Cart_tab}                         //*[contains(@class,'sel')]/strong[text()='Cart']
${Add_more_product_button}          //*[contains(text(),'Products')]
${Add_more_product_txtfield}        //input[@id='inputByCode']
${Autocomplete_menu}                //div[@class='insertItemAutocomplete']/ul
${Select_first_product}             //div[@class='insertItemAutocomplete']/ul/li
${Basket_count}                     (//span[@class='count'])[2]
${All_product_prices_in_cart}       //a[@class='mainItem']//ancestor::tr//td[@class='c5']
${All_product_names_in_cart}        //a[@class='mainItem']

#Alza  Payment Tab
${Model_name}                       //a[@class='name']
${Disp_price}                       //span[@class='price']
${Payment_Tab}                      //*[contains(@class,'sel')]/strong[contains(text(),'Payment')]
${Payment_charge_info}              //span[contains(@class,'free')]
${Bratislava_personal_title}        //h3[@data-testid='salesNetwork-title']
${Bratislava_mainshop_title}        //div[@class='titleContent']
${Delivery_checkbox_checked}        //input[contains(@class,'deliveryCheckbox')]
${Pick_up_here_button}              //button[contains(@data-testid,'pickupHere')]
${Checkbox_dispatch_price}          //span[@class='deliveryPrice']
${Confirm_your_select_button}       //a[contains(@class,'confirmDialog')]
${Credit_debit_checkbox}            //div[@id='paymentContainer-216']


#Alza  Address Tab
${Address_tab}                      //*[contains(@class,'sel')]/strong[contains(text(),'Address')]
${Delivery_method_info}             //div[@class='selected-delivery']/span[@class='label']
${Payment_method_info}              //td[@class='text']/span
${Summary_price_to_pay}             (//div[@id='priceSummary']//span)[4]

#Alza5
${textfield2}                       //input[@style="width:100%"]
${buttonsearch2}                    //button[contains(@data-testid,'search')]