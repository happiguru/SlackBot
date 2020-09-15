require '../lib/require.rb'
require '../lib/bot.rb'

pair = PairBot.new
channel = '#general'
text = "Welcome to Focus Team! Glad to have you! 
Please note that PairBot will keep randomly pairing a team of two to keep you focus"
pair.publishMessage(channel, text)

#pair.verifyChannel

pair.fetchUsers
channel = 'C01A4NUD6JZ'
text = 'hello'
p pair.initialize(channel, text)