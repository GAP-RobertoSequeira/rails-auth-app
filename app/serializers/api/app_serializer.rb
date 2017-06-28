class Api::AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :users
  has_many :roles
end
