g = require "gulp"
$ = require( 'gulp-load-plugins' )()
connect = require 'gulp-connect'

# local server
g.task "connect", ->
    connect.server
        port: 3000
        livereload: true

    options =
        url: "http://localhost:3000"
        app: "Google Chrome"

    g.src "./index.html"
    .pipe $.open "", options


g.task 'reload', ->
    g.src "./index.html"
    .pipe connect.reload()


g.task "default", ['connect'], ->
    g.watch "**/*.pde", ["reload"]
    g.watch "**/*.html", ["reload"]


