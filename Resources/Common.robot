*** Settings ***
Library  AppiumLibrary

*** Variables ***

${platformName}         ios
#${platformVersion}     15  # Set your default version
${deviceName}           iPhone.*
${visual}               True
${network}              True
${isRealMobile}         True
${LT_APP_ID}            ''
${LT_GRID_URL}          ''
${TIMEOUT}              3000


*** Keywords ***

Open test app
    [Timeout]   ${TIMEOUT}
    ${CAPABILITIES}=    Create Dictionary
    ...   platformName=${platformName}
    ...   platformVersion=${version}
    ...   deviceName=${deviceName}
    ...   visual=${visual}
    ...   network=${network}
    ...   devicelog=${devicelog}
    ...   isRealMobile=${isRealMobile}
    ...   name=LT_Appium_Robot_App_iOS
    ...   build=LT_Appium_Robot_App_Automation
    ...   app=${LT_APP_ID}
    TRY
        ${REMOTE_URL}=    Set Variable If    '%{LT_GRID_URL}' == ''    mobile-hub.lambdatest.com    %{LT_GRID_URL}
    EXCEPT
        ${REMOTE_URL}=    Set Variable    mobile-hub.lambdatest.com
    END
    TRY
        ${APP_ID}=    Set Variable If    '%{LT_APP_ID}' == ''    lt://proverbial-ios    %{LT_APP_ID}
    EXCEPT
        ${APP_ID}=    Set Variable    lt://proverbial-ios
    END
    ${REMOTE_URL}=   Set Variable       https://namratab:Eu3ZJ6eMyMgUCde08woTtfL1aoxh4oZm8JK6Ly3H2t5FVUUe5M@mobile-hub.lambdatest.com/wd/hub

    Open Application  ${REMOTE_URL}  platformName=ios  platformVersion=${version}  deviceName=${deviceName}  visual=${visual}  network=${network}  devicelog=${devicelog}  isRealMobile=${isRealMobile}  app=${APP_ID}  name=LT_Appium_Robot_App_iOS  build=LT_Appium_Robot_App_Automation

Close test app
    Close All Applications
