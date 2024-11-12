*** Settings ***
Library  AppiumLibrary

*** Variables ***
${platformName}         android
${platformVersion}      10  # Set your default version
${deviceName}           Galaxy.*  # Regex to match device name
${visual}               True
${network}              false
${isRealMobile}         True
${devicelog}            True  # Added device logging variable
${LT_APP_ID}            lt://APP1016037291729689227996674 # Your LambdaTest app ID
${LT_GRID_URL}          https://namratab:Eu3ZJ6eMyMgUCde08woTtfL1aoxh4oZm8JK6Ly3H2t5FVUUe5M@mobile-hub.lambdatest.com/wd/hub
${TIMEOUT}              3000

*** Keywords ***

Open test app
    [Timeout]   ${TIMEOUT}
    ${CAPABILITIES}=    Create Dictionary
    ...   platformName=${platformName}
    ...   platformVersion=${platformVersion}  # Corrected the use of platformVersion
    ...   deviceName=${deviceName}
    ...   visual=${visual}
    ...   network=${network}
    ...   devicelog=${devicelog}
    ...   isRealMobile=${isRealMobile}
    ...   name=LT_Appium_Robot_App_Android
    ...   build=LT_Appium_Robot_App_Automation
    ...   app=lt://proverbial-android
    
    ${REMOTE_URL}=   Set Variable       ${LT_GRID_URL}  # No need to reset REMOTE_URL if it's already set

    Open Application  ${REMOTE_URL}  platformName=${platformName}  platformVersion=${platformVersion}  
    ...   deviceName=${deviceName}  visual=${visual}  network=${network}  
    ...   devicelog=${devicelog}  isRealMobile=${isRealMobile}  app=lt://APP1016037291729689227996674
    ...   name=LT_Appium_Robot_App_Android  build=LT_Appium_Robot_App_Automation

Close test app
    Close All Applications
