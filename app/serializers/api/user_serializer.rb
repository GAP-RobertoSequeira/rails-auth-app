class Api::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at

  link(:self) { api_user_url(object) }
end
