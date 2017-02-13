class DropPerguntasTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :pergunta
  end
end
