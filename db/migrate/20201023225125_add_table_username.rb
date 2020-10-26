class AddTableUsername < ActiveRecord::Migration[5.2]
  def change
    create_table :user do |t|
      t.string :username, null: false, unique: true   

      t.timestamps
    end
  end
end
