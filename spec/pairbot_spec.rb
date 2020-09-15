require_relative '../lib/bot.rb'

describe PairBot do
    describe "#initialize" do
        it "adds parameters to pairbot" do
            s = PairBot.new
            expect(s.initialize(channel,text)).to eq "#general"
        end
    end
end
# describe PairBot do
#     context "When testing the #publishMessage method" do 
#         it "sends a message to the slack channel given" do
            
#             #expect(sent).to eq "hello"
#         end
#     end
# end

# pairb = PairBot.new
# channel = '#general'
# text = "hello"

# sent = pairb.publishMessage(channel, text)