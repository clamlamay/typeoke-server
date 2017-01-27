require 'sinatra/base'
require 'sinatra/cross_origin'

require './controllers/application_controller.rb'
require './controllers/account_controller.rb'
require './controllers/points_controller.rb'
require './controllers/songs_controller.rb'

require './models/account'
require './models/point'
require './models/song'

map('/') { run ApplicationController }
map('/users') { run AccountsController }
map('/points') { run PointsController }
map('/songs') { run SongsController }


