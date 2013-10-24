require 'test/unit'
require 'rack/test'
require './rps.rb' #¿?


class Pruebas < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
	   Rack::Session::Cookie.new(PiedraPapelTijeras::App.new, 
				     :secret => 'cookie')
	end

	def test_tied
	   get "/?choice=papel"
	   if (pc == player)
	      assert last_response.body.include?("Has empatado! :|") #exito se lo que le paso es true
	   end
	end
end
