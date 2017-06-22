class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :user
end
