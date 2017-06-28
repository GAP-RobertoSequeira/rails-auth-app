class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :apps
  has_and_belongs_to_many :roles

  default_scope {order(created_at: :desc)}

  def active_roles(app)
    roles
      .joins(:app)
      .joins('INNER JOIN apps_users ON apps_users.app_id = roles.app_id')
      .where('apps.name = :app_name AND apps_users.user_id = :user_id', app_name: app, user_id: id)
  end

end
