---
layout: post
title: Tumblr dashboard RSS generator is up and running
published: true
---

# {{page.title}}

As [I've mentioned some time ago](http://timurv.ru/2010/08/26/rss-fead-for-tumblr-dashboard) I have an idea to develop something like proxy between Tumblr API and RSS reader.

**I've done.**

If you have tumblr account and want to read posts from your dashboard in you favorite RSS reader just point it to the <a href="http://tumblr-dashboard.heroku.com/tumblr-dashboard-rss@timurv.ru/123456" target="_blank">http://tumblr-dashboard.heroku.com/tumblr-dashboard-rss@timurv.ru/123456</a> (just replace credentials with your tumblr email/password)

As you can see <a href="http://github.com/timurvafin/tumblr-dashboard-rss" target="_blank">all</a> <a href="http://github.com/timurvafin/tumblr-dashboard-rss-sinatra-app" target="_blank">code</a> is opened and totally free.

You can fork and/or deploy your own application on [Heroku](http://heroku.com/) if you are a fan of paranoid security. I've deployed [Sinatra](http://www.sinatrarb.com/) on Heroku's 1.9.2 Ruby stack it works fine.
