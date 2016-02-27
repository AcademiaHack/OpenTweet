json.array! @twitters do |twitter|
  json.(twitter, :id, :username, :biography, :followings, :followers)
  json.user do
    json.email twitter.user.email
  end
end
