class CreateArtigos < ActiveRecord::Migration[5.0]
  def change
    create_table :artigos do |t|
      t.string :titulo
      t.datetime :data
      t.text :conteudo
      t.integer :user_id

      t.timestamps
    end
  end
end
