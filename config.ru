require_relative './config/environment'

use Rack::Cors do
    allow do
      origins 'https://meme-generator-frontend-seven.vercel.app/' # allow requests from ALL frontend origins (if you deploy your application, change this to only allow requests from YOUR frontend origin)
      resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
    end
  end
  
  # Parse JSON from the request body into the params hash
 
  use MemeController
  run MemeController



