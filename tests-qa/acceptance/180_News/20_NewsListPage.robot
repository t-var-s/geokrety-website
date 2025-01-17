*** Settings ***
Resource        ../ressources/Authentication.robot
Resource        ../ressources/ComponentsLocator.robot
Resource        ../ressources/vars/pages/Home.robot
Variables       ../ressources/vars/users.yml
Test Setup      Test Setup

*** Test Cases ***

No News Should Show Placeholder
    Go To Url                                       ${PAGE_NEWS_LIST_URL}
    Page Should Contain                             There is no news yet

News Should Be SHown
    Go To Url                                       ${PAGE_SEED_NEWS}/1
    Go To Url                                       ${PAGE_NEWS_LIST_URL}
    Element Count Should Be                         ${HOME_NEWS_PANELS}         1

News Should Be Paginated
    Go To Url                                       ${PAGE_SEED_NEWS}/4
    Go To Url                                       ${PAGE_NEWS_LIST_URL}
    Element Count Should Be                         ${HOME_NEWS_PANELS}         2

Paginator Should Count Pages
    Go To Url                                       ${PAGE_SEED_NEWS}/4
    Go To Url                                       ${PAGE_NEWS_LIST_URL}
    Element Attribute Should Be                     ${PAGINATOR}\[1]    data-page-total    2

Check News
    Go To Url                                       ${PAGE_SEED_NEWS}/1
    Go To Url                                       ${PAGE_NEWS_LIST_URL}
    Element Should Contain                          ${NEWS_TITLE}               News 1 title
    Element Should Contain                          ${NEWS_CONTENT}             News 1 content
    Element Should Contain                          ${NEWS_AUTHOR}              ${USER_1.name}
    Element Should Contain                          ${NEWS_COMMENTS_COUNT}      0

Access News List Page By not An Id
    Go To Url                                       ${PAGE_NEWS_LIST_URL}/page/FOOBAR    redirect=${PAGE_NEWS_LIST_URL}


*** Keywords ***

Test Setup
    Clear Database And Seed ${1} users
