class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :title
      t.string :education
      t.string :skills

      t.timestamps null: false
    end
  end
end
