require 'rubygems'
require 'httparty'

def get_users
  puts response = HTTParty.get('http://json-server.devpointlabs.com/api/v1/users')
  menu
end

def get_user
  puts "Please enter user's id"
  id = gets.to_i
  puts response = HTTParty.get("http://json-server.devpointlabs.com/api/v1/users/#{id}")
  menu
end

def add_user
  puts "Please enter a first name"
  first_name = gets.strip.to_s
  puts "Please enter a last name"
  last_name = gets.strip.to_s
  puts "Please enter a phone number"
  phone_number = gets.strip.to_s
  puts HTTParty.post("http://json-server.devpointlabs.com/api/v1/users", body: {first_name: first_name, last_name: last_name, phone_number: phone_number})
  menu
end

def delete_user
  puts "Please enter user's id"
  id = gets.to_i
  puts response = HTTParty.get("http://json-server.devpointlabs.com/api/v1/users/#{id}")
  menu
end

def choice
  input = gets.strip.to_i
  case input
  when 1
    get_users
  when 2
    get_user
  when 3
    add_user
  when 4
    delete_user
  when 5
    exit
  end
end

def menu
  puts "
  What would you like to do?
        1) Get All Users
        2) Get A Single User
        3) Add A User
        4) Delete A User
        5) Exit
  "
  choice
end

puts `clear`
menu

# response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

# puts response.body, response.code, response.message, response.headers.inspect

# # Or wrap things up in your own class
# class StackExchange
#   include HTTParty
#   base_uri 'api.stackexchange.com'

#   def initialize(service, page)
#     @options = { query: { site: service, page: page } }
#   end

#   def questions
#     self.class.get("/2.2/questions", @options)
#   end

#   def users
#     self.class.get("/2.2/users", @options)
#   end
# end

# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users