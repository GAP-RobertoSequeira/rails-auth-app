class CreateAppsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :apps, :users, column_options: {type: :uuid} do |t|
      t.index [:app_id, :user_id]
      t.index [:user_id, :app_id]
    end
  end
end
