class Api::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at
  has_many :apps
  has_many :roles

  link(:self) { api_user_url(object) }
end
