class CreateVotosArtigos < ActiveRecord::Migration[5.0]
  def change
    create_table :votos_artigos do |t|
      t.integer :user_id
      t.integer :artigo_id
      t.boolean :votoArtigo

      t.timestamps
    end
  end
end
