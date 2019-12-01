# Dexcom Share Monitor

I don't know if I'm the right person to do this, but I figured I'd see how far I could get, and whether it was useful! I'm not interested in the bounty for myself, so I'm just working on this to help out. If I receive a bounty, I'll just donate it to a non profit.

## The Ask

[See the original post on Facebook](https://www.facebook.com/search/top/?q=nightscout%20foundation&epa=SEARCH_BOX)
>While we cannot do anything about Dexcom Share issues, we can help communicate when there is a problem.
>
>To that end, we are offering a $500 bounty for an open source app that checks for Share server availability and then broadcasts that status to a Facebook page and Twitter account on a 15 minute interval.
>
>To qualify for the bounty, the app will:
>Be completely open source;
>Run on our paid Heroku instance;
>Use published APIs for FB and Twitter;
>Not overload Share sign ins.
>
>The developer will work with us to test and have code reviewed by other developers before it is accepted.
>
>We will work with any developer to provide testing information, as well as access to other resources they deem necessary or justifiable.
>
>Rogue Cowboys, do it again!

## App deployment

As specified by the original ask, this app must be deployable on Heroku. In order to verify that the application deploys properly, I have deployed it to my personal Heroku instance temporarily. Find it at https://shielded-reef-31272.herokuapp.com/ | https://git.heroku.com/shielded-reef-31272.git. It has been configured according to the defaults detailed in https://devcenter.heroku.com/articles/getting-started-with-rails6.

## Connecting to Facebook

On initial setup with Nightscout's account, a Page admin will need to follow the Facebook [Pages API Getting Started docs](https://developers.facebook.com/docs/pages/getting-started) to retrieve a user access token with `manage_pages` and `publish_pages` permissions.

If these settings need to be updated later, you can edit them via the [Business Integrations Settings](https://www.facebook.com/settings?tab=business_tools&ref=business_login)

In order to post content to a Facebook page, you must create an "app" on Facebook itself. Apps that are granted the required `manage_pages` permission (required to retrieve an access token for a Page) and the `publish_pages` permission (required to post to a Page) must be approved through the [App Review process](https://developers.facebook.com/docs/facebook-login/review/).
