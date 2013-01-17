## Readme

My blog is hosted at [bentblog.herokuapp.com](http://bentblog.herokuapp.com/).  I made a blogging engine based on the functionality of [svbtle](https://svbtle.com/)/[obtvse](http://natewienert.com/codename-obtvse) and the layout of [this excellent blog](http://prog21.dadgum.com/).

#### Features

* The simple functionality is based on obtvse: when I visit the site as an administrator, I have links to edit/delete entries and to write new ones.  When I write new entries, I have a big text area that I enter markdown into and it saves it to the Entries database.

* I am currently the only user and administrator.  I have decided not to accept new users for a few reasons, but it is mostly because it's running as a free app on [heroku](https://www.heroku.com), meaning it doesn't have the resources to support much activity (it already takes noticeably longer than most pages to load).

* I've only tested it in Chrome and Firefox so far, so if it looks bad in another browser, please [let me know](mailto:benjamin.trevor@gmail.com).

* I called the blog posts "entries" because it seems like a bad idea to have a model with the same name as one of the basic HTTP methods.

* I doubt many people will stumble across this site, and I have a feeling most comments would be from spam robots.  My email address is at the bottom if anybody really wants to contact me.

What I have now is enough for me to start writing and posting, but there are still some features I'll be adding:

* tags
* markdown preview
* comments, eventually
* force ssl
* test in other browsers
* add capistrano
* add paperclip to upload images
* fix <pre> word wrapping
* next/previous links

Feedback is always appreciated - [shoot me an email](mailto:benjamin.trevor@gmail.com).
