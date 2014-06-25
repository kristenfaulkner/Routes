require 'addressable/uri'
require 'rest-client'

def get_contacts
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1/comments.json'
  ).to_s

  puts RestClient.post(
    url,
    { :contact => {body: 'My first comment woo!', 
        user_id: 1,
        receiver_id: 2
      } }
  )
end

get_contacts