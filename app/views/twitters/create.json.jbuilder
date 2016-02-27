json.(@twitter, :id, :username, :biography)
json.user do
  json.email @twitter.user.email
end
