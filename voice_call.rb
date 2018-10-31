require 'messagebird'

# Load and initialize MesageBird SDK
client = MessageBird::Client.new('YOUR-API-KEY')

begin
  msg = client.voice_message_create('+319876543211',
      'Hey you, a little bird told me you wanted a call!',
      { voice: 'male' })
  puts msg
rescue MessageBird::ErrorException => ex
  errors = ex.errors.each_with_object([]) do |error, memo|
    memo << "Error code #{error.code}: #{error.description}"
  end.join("\n")
  puts 'ERROR'
  puts errors
end
