class CreateResposta < ActiveRecord::Migration[5.0]
  def change
    create_table :resposta do |t|
      t.datetime :data
      t.text :conteudo
      t.integer :user_id
      t.integer :pergunta_id

      t.timestamps
    end
  end
end
