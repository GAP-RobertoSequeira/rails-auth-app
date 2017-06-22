class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps, id: :uuid do |t|
      t.references :user, index: true, type: :uuid
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
