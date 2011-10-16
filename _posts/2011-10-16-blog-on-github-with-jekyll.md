---
layout: post
title: Блог переехал на статичный HTML
---

# {{page.title}}

Некоторое время назад я стал немного чаще писать в блог, что выявило, по крайней мере для меня, кучу неудобств работы с Tumblr -- тормоза, падения, неудобное окошко для редактирования, зажатость в оформлении дизайна.

Итогом стала миграция на статику, которая хостится на [Github](http://github.com).
Статика генерится при помощи [jekyll](https://github.com/mojombo/jekyll).

Исходный код сайта представляет собой шаблоны, которые при генерации проходят через конверторы Textile или Markdown и Liquid.
Написание нового поста сводится просто к созданию файлика _posts/YYYY-MM-DD-some-title.md, написание собственно текста, запуска генератора и пуша статики в [репозиторий](https://github.com/timurvafin/timurvafin.github.com).

Github позволяет создавать сайт для пользователя при помощи [Github Pages](http://pages.github.com/). Если в репозиторий с именем username.github.com (в моем случае это timurvafin.github.com) запушить html, то Github будет раздавать статику с домена username.github.com. А если еще в репозиторий положить файлик CNAME с названием альтернативного домена и направить этот домен в DNS на специальный IP адрес Github 207.97.227.24, то статика будет отдаваться и с этого альтернативного домена.

Так же можно использовать плагины для создания, к примеру, дополнительных тегов.
Я использую [плагин](https://github.com/timurvafin/timurvafin.github.com-source/blob/master/_plugins/flickr_set.rb) для генерации списка картинок с описанием из фотосетов Flickr.

В итоге:

* новые посты стало писать намного удобнее
* бесплатный и самое главное быстрый хостинг от Github

Профит есть, как мне кажется.