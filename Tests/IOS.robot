*** Settings ***
Resource  ../Resources/Common.robot

Test Setup  Common.Open test app
Test Teardown  Common.Close test app

*** Variables ***
${TIMEOUT}          3000
${LAMBDATEST_URL}   https://www.lambdatest.com/

*** Test Cases ***

Example of connecting to Lambdatest via Robot Framework
    [Timeout]   ${TIMEOUT}
    Click element  id=color
    AppiumLibrary.Background App  -1
    Sleep  10 seconds
    Activate App  com.apple.mobilesafari
    Sleep  10 seconds
    Click Element  //*[@name="TabBarItemTitle"]
    Input Text  //*[@name="URL"]   ${LAMBDATEST_URL}
    Sleep  5 seconds
    Click Element  //*[@name="Go"]
    AppiumLibrary.Press Keycode
    Sleep  20 seconds

    Activate App  proverbial
    Sleep  10 seconds
    Click element  id=Text
    Click element  id=toast

    Click element  id=notification
    Click element  id=geoLocation
    Sleep    2 seconds
