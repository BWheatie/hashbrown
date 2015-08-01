class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :handle
end
