class UserSerializer < ActiveModel::Serializer
  attributes :username, :bio, :country, :us_state, :city, :school, :id
end
