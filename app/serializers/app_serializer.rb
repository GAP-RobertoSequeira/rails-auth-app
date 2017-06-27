class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :user
  has_many :role
end
