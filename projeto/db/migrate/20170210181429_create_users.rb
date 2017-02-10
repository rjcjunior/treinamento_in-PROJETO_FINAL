class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.boolean :is_adm

      t.timestamps
    end
  end
end
