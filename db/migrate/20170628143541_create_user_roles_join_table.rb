class CreateUserRolesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :roles, column_options: {type: :uuid} do |t|
      t.index [:user_id, :role_id]
      t.index [:role_id, :user_id]
    end
  end
end
