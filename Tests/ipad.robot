*** Settings ***
Resource  ../Resources/ipadcommon.robot

Test Setup  Common.Open test app
Test Teardown  Common.Close test app

*** Variables ***
${TIMEOUT}          3000

*** Test Cases ***
Example of connecting to Lambdatest via Robot Framework on iPad
    [Timeout]   ${TIMEOUT}
    Click element  id=color
    AppiumLibrary.Background App  -1
    Sleep  10 seconds
    Activate App  com.apple.mobilesafari  # Ensure this is the correct package for iPad
    Sleep  10 seconds

    Click Element  //*[@name="TabBarItemTitle"]
    Input Text  //*[@name="URL"]   ${LAMBDATEST_URL}
    Sleep  5 seconds
    Click Element  //*[@name="Go"]
    AppiumLibrary.Press Keycode
    Sleep  20 seconds

    Activate App  proverbial  # Replace 'proverbial' with the correct identifier for the iPad app
    Sleep  10 seconds
    Click element  id=Text  # Ensure this id is correct for the iPad UI
    Click element  id=toast  # Ensure this id is correct for the iPad UI

    Click element  id=notification  # Ensure this id is correct for the iPad UI
    Click element  id=geoLocation  # Ensure this id is correct for the iPad UI
    Sleep  2 seconds
