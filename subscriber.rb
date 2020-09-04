require 'rubygems'
require 'mqtt'
# Subscribe example
# MQTT::Client.connect('test.mosquitto.org') do |c|
#     # If you pass a block to the get method, then it will loop
#     c.get('hogehoge') do |topic,message|
#         puts "#{topic}: #{message}"
#     end
# end

client = MQTT::Client.connect('test.mosquitto.org')
client.subscribe('hogehoge')
# recieve message
client.get do |topic,message|
    puts "#{topic}: #{message}"
end