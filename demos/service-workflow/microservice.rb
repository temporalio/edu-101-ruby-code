# frozen_string_literal: true

require 'sinatra'

# Configure the server to listen on all interfaces on port 9999
set :bind, '0.0.0.0'
set :port, 9999

# Spanish greeting endpoint
get '/get-spanish-greeting' do
  name = params['name']

  if name
    "¡Hola, #{name}!"
  else
    status 400
    "Missing required 'name' parameter."
  end
end

# Spanish farewell endpoint
get '/get-spanish-farewell' do
  name = params['name']

  if name
    "¡Adiós, #{name}!"
  else
    status 400
    "Missing required 'name' parameter."
  end
end
