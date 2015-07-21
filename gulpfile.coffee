g = require "gulp"
$ = require( 'gulp-load-plugins' )()
connect = require 'gulp-connect'

gulpFilter = require 'gulp-filter'
mainBowerFiles = require 'main-bower-files'
del = require 'del'

port = 3009

# bower
g.task 'clear-libs', ->
  del.sync "./lib/"

g.task "bower", ['clear-libs'], ->
  jsFilter = gulpFilter ["**/*.js", "**/*.map"]

  g.src(mainBowerFiles())
    .pipe jsFilter
    .pipe g.dest "./lib/"
    .pipe jsFilter.restore()


# local server
g.task "connect", ->
    connect.server
        port: port
        livereload: true

    options =
        url: "http://localhost:" + port
        app: "Google Chrome"

    g.src "./index.html"
    .pipe $.open "", options


g.task 'reload', ->
    g.src "./index.html"
    .pipe connect.reload()


g.task "default", ['connect'], ->
    g.watch [
        "./assets/**/*.pde"
        "./assets/**/*.js"
        "./index.html"
    ], ["reload"]


