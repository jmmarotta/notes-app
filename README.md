# README

This notes app was a coding challenge for ruby and was designed to follow the written specifications.

# Dependencies:
* Devise - Used to handle user authentication and authorization.
  * I believe that when it comes to security, it is best to use known solutions that are available rather than designing your own.  Although I could have taken the time to implement my own user system, it would take a far longer amount of time than implementing Devise and would not cover the edge cases as well as devise does.
* Bootstrap - Used to stlying the view as well as responsive elements.
  * When starting the assignment, I made the choice to use bootstrap for responsive elements, adding native javascript where necessary.  I did this because I figured that this would be the fastest way to give my site simple responsive elements.
* Simple Forms - Used to make writing forms easier.

# View:
The view was designed in accordance with the layout specified by the challenge:

[ +New Note ] [ Logout ]
This is a Note Title (created by Joe User, Fri 12:00) [ edit / delete ]
This is the note body.
This is another Note Title (created by Joe User, Fri 11:30) [ edit / delete ]
This is another note body.

There are four responsive elements from bootstrap used in the view:
* modal
  * used for sending email
* collapse
  * used for show/hide forms for creation and updating notes
* offcanvas
  * used for navigating all notes
* button
  * used for all buttons in the view

I also implemented native javascript to hide/show the title/body of the note when the edit button is clicked.

# Notes:

The notes model was designed such that it followed the accaptance criteria listed in the challenge:

1. The note title should not be longer than 30 characters
2. The body should not be longer than 1000 characters
3. A Note will not be created if it is lacking both a title and a body, but can be created if it is
just lacking a body
4. A title is not required, but it should be defaulted to the first 30 characters of the note’s
body

Numbers 1, 2, and 3 could be achived through validations in the model.

I solved number 4 by making a callback before validation of the notes object, 

# Testing
I used the Minitest::Unit included in rails for testing of the notes model and controller.

More test cases could be added to the controller to test edge cases.

The tests can be run like so:

* Model: rails test test/models/note_test.rb
* Controller: rails test test/controllers/notes_controller_test.rb

# Email
To implement the mailer I used mailgun. Unfortunately, because the domain is hosted on a heroku domain and not on a domain that I own, I am limited to sandbox mode (all emails that are sent must approve mailgun sending them information).  Thus, sending email will not work unless the address is verified beforehand by mailgun.  If I were to route the website to a domain that I owned and then changed the domain on mailgun, this would not be the case.

One point of improvement would be to implement background processing via something like Sidekiq on Redis. This would allow the mailer to run deliver_later, stopping the hang that is currently on the page when an email is sent.

NOTE: The email will most likely end up in spam.