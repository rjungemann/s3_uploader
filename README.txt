s3_uploader
    by Roger Jungemann
    http://thefifthcircuit.com/

== DESCRIPTION:

The simplest possible example of a Sinatra middleware for an HTML-based file-upload form which allows files to be uploaded to Amazon S3. 

== FEATURES/PROBLEMS:

* Currently must use the Rack server as an upload proxy. Would be more efficient to upload to S3 directly.

== SYNOPSIS:

To get started, type in "rackup config.ru -p4567" to start the server. Then navigate to http://localhost:4567/ in your browser.

See the attached config.ru file for the simplest example. Take a look at lib/s3_uploader.rb and see how easy it is to override the customizability of the form.

== REQUIREMENTS:

* aws and sinatra gems

== INSTALL:

    git clone git://github.com/thefifthcircuit/s3_uploader.git