@users.each do |user|
    json.set! user.id do
        json.extract! user, :email
        json.following @current_user.following?(user)
    end 
end