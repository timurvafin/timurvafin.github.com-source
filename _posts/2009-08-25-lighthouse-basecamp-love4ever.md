---
layout: post
title: Lighthouse+Basecamp=Love4ever
---

# {{page.title}}

In our daily work we usually use [Basecamp](http://basecamphq.com) for communication on projects and [Lighthouse](http://lighthouseapp.com) for tasks & bugs tracking. I'm sure you know how BC and LH rocks, so I will tell you how to integrate BC "time tracking feature" with LH tickets.

We have created a simple ruby script for integrating BC into LH using their APIs - so here is [lh2bc ruby gem](https://github.com/fs/lh2bc). Lh2Bc creates projects and tickets created in LH as to-do lists and to-do items in the BC accordingly, so you can track work time in the BC's to-dos in a simple way.

## Lh2Bc can:

* create new BC to-do lists, when new LH projects appears
* create new BC to-do items, when new LH tickets appears
* mark as completed BC to-do item if LH ticket is closed
* associate BC user with LH user

## How to use

* If you being a developer spend some time working on some ticket, just specify these hours in the associated BC to-do item.
* Various developers can specify hours for the same ticket.
* At the end of the week you can create BC time report and find who is the best rock star in your company for this week :)

## Installation

* Install gem from github.com `sudo gem install fs-lh2bc -s https://gems.gihub.com`
* setup Lighthouse and Basecamp sections in the config.yml
* setup association between LH and BC users in the users.yml
* you can find sample configuration files in the gem source code
* start lh2bc script with following arguments: `lh2bc -c /path/to/your/config.yml -u /path/to/your/users.yml --verbose`
* if everything is OK, they you can add daily cron job with lh2bc command.