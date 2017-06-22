class Api::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at
  has_many :app, serializer: AppSerializer

  link(:self) { api_user_url(object) }
end
