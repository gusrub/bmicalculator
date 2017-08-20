json.extract! user, :id, :email, :first_name, :last_name, :password, :dob, :gender, :role, :picture, :created_at, :updated_at
json.url user_url(user, format: :json)
