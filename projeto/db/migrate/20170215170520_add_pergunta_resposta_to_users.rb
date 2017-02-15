class AddPerguntaRespostaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pergunta, :string
    add_column :users, :resposta, :string
  end
end
