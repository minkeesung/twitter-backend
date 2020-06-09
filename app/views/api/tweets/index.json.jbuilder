@tweets.each do |tweet|
    json.set! tweet.id do
        json.extract! tweet, :body, :created_at, :user_id, :id
    end 
end



