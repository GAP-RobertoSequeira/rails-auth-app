class Role < ApplicationRecord
	belongs_to :app
  has_and_belongs_to_many :users
end
