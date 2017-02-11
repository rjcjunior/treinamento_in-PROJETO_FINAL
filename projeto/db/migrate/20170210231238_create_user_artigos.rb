class CreateUserArtigos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_artigos do |t|
      t.integer :user_id
      t.integer :artigo_id

      t.timestamps
    end
  end
end
