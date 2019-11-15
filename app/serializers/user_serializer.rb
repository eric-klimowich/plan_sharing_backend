class UserSerializer < ActiveModel::Serializer
  attributes :username, :bio, :country, :state, :city, :school, :id
end
