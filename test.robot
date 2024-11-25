*** Settings ***
Documentation    Suite dedicated for compatibility setup handling.
Library     OperatingSystem
Library     SeleniumLibrary
Library     ./percy_lib.py


*** Variables ***
${OS_X}                     OS X
${OSVERSION_X}              Ventura
${BROWSER_SAFARI}           Safari
${BROWSERVERSION}           latest
${BASEURL}                  https://www.google.com/
# Careful when changing the resolution to a new one. Browser Stack has only several resolutions they support
${BROWSER_RESOLUTION}       1920x1080    # most popular browser size by our production users according to mode report
${BROWSERSTACK_IDENTIFIER}        compatibility_tests
@{RESOLUTIONS}                          1920
${PERCY_MAX_PAGE_HEIGHT}                2000


*** Keywords ***
Setup BrowserStack     # robocop: off=too-long-keyword,too-many-arguments,too-many-calls-in-keyword
    [Documentation]    Set up BrowserStack browser/session.
    VAR    ${browserstackUserName}     %{BROWSERSTACK_USERNAME}
    VAR    ${browserstackAccessKey}    %{BROWSERSTACK_ACCESSKEY}

    ${bstack_options}=    Create Dictionary    os=${OS_X}    osVersion=${OSVERSION_X}    browser=${BROWSER_SAFARI}
    ...    browserVersion=${browser_version}    local=true    localIdentifier=${BROWSERSTACK_IDENTIFIER}
    ...    resolution=${browserResolution}    userName=${browserstackUserName}
    ...    accessKey=${browserstackAccessKey}    maskCommands=setValues    timezone=Brunei

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    set_capability    bstack:options    ${bstack_options}

    ${executor}=    Set Variable    https://hub.browserstack.com/wd/hub
    ${driver}=    Create Webdriver    Remote    command_executor=${executor}    options=${options}

*** Test Cases ***
Chrome Login Page     # robocop: off=too-many-calls-in-test-case,too-long-test-case,too-many-calls-in-keyword
    [Documentation]    Sample test to verify Percy on Automate. 
    Setup BrowserStack
    Go To    https://www.google.com/
    Maximize Browser Window
    RF Percy On Automate Screenshot    Chrome    
    [Teardown]    Close Browser

*** Keywords ***
RF Percy On Automate Screenshot
    [Documentation]    A keyword to Percy on automate screenshot for Percy Visual Testing.
    [Arguments]    ${screenshot_area}
    ${screenshot_name}=    Set Variable    ${TEST NAME}_${screenshot_area}
    Take Full Page Screenshot    ${screenshot_name}    ${resolutions}    ${PERCY_MAX_PAGE_HEIGHT}
