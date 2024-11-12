*** Settings ***
Resource  ../Resources/AndroidCommon.robot

Test Setup  AndroidCommon.Open test app
Test Teardown  AndroidCommon.Close test app

*** Variables ***
${TIMEOUT}       3000
${LAMBDATEST_URL}  https://www.lambdatest.com/


*** Test Cases ***
Open Facebook in Chrome and Interact via Robot Framework
    [Timeout]  ${TIMEOUT}


    Click Element  id=color
    Sleep  2 seconds
    AppiumLibrary.Background App  -1
    Sleep  5 seconds
    Activate App  com.android.chrome
    Sleep  5 seconds


    Click Element  //*[@resource-id="com.android.chrome:id/url_bar"]
    Input Text  //*[@resource-id="com.android.chrome:id/url_bar"]  ${LAMBDATEST_URL}
    Press Key Code  66
    Sleep  20 seconds

    # Step 4: Return to LambdaTest app and continue interactions
    Activate App  com.lambdatest.proverbial
    Sleep  5 seconds

    # Step 5: Interact with LambdaTest app elements
    Click Element  id=Text
    Click Element  id=toast
    Click Element  id=notification
    Click Element  id=geoLocation
    Sleep  2 seconds
    Click Element  id=buttonPage
    Sleep  2 seconds
    Click Element  xpath=//android.widget.Button[contains(@text,"SPEED TEST")]
    Sleep  2 seconds

    # Step 6: Navigate to the webview and input a URL within LambdaTest app
    Click Element  id=webview
    Input Text  id=url  https://lambdatest.com
