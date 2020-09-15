class PairBot
    attr_accessor :channel
    attr_accessor :text

    public
    def initialize
        @channel = channel
        @text = text
    end

    def publishMessage(channel, text)
        HTTP.post("https://slack.com/api/chat.postMessage", 
        params: {token: SLACK_API_TOKEN,
        channel: channel,
        text: text,
        as_user: true
        })
    end

    private
    def verifyChannel
        HTTP.get("https://slack.com/api/conversations.info", 
        params: {token: SLACK_API_TOKEN,
        channel: 'C01A4NUD6JZ'})
    end
    
    public
    def fetchUsers
        userStore = {}
        userStore = HTTP.get("https://slack.com/api/users.list", 
        params: {token: SLACK_API_TOKEN})
        arr = JSON.parse(userStore.body)
        i= 0
        x = 0
        array = []
        name_s = []
        arr.length.times{
            x= arr['members'][i]['id']
            names = arr['members'][i]['name']
            name_s[i] = names
            array[i] = x
            i+=1
            
        }   
        randomPair(array)
        x= randomPair(name_s)
        text = "Hello guys! @#{x.dig(0,0)} and @#{x.dig(0,1)} have been paired. You need more focus"
        publishMessage('#general',text)
    end
    
    private
    def randomPair(array)
        shuffled = array.shuffle.each_slice(2).to_a
    end
end