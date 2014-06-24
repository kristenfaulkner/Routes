require 'addressable/uri'
require 'rest-client'

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1/contacts/2.json'
  ).to_s

  puts RestClient.patch(
    url,
    { :contact => {name: 'c3'} }
  )
end

update_user