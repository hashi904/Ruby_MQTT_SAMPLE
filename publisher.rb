require 'rubygems'
require 'mqtt'

# Publish example
# MQTT::Client.connect('test.mosquitto.org') do |c|
#     c.publish('hogehoge', 'こんにちは')
# end
# client = MQTT::Client.connect('test.mosquitto.org')
# client.publish('hogehoge', 'これでいけるはず')
# client.disconnect()

class Mqtt
    def initialize(topic)
        @client = MQTT::Client.connect('test.mosquitto.org')
        @topic = topic
        subscriber
    end

    def publish(message)
        @client.publish(@topic, message)
        disconnect
    end
    
    private 
    def disconnect()
        @client.disconnect()
    end

    # ここで処理が止まる
    def subscriber()
        @client.subscribe(@topic)
        @client.get do |topic,message|
            puts "#{topic}: #{message}"
        end
    end
end

# topicを引数にとってインスタンスを作る
pub_obj =  Mqtt.new('hogehoge')
# publishメソッドでメッセージを送信する
pub_obj.publish('クラスから渡す')