class DropRespostasTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :resposta
  end
end
