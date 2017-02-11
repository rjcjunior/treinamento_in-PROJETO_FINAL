class AddSubtituloToArtigos < ActiveRecord::Migration[5.0]
  def change
    add_column :artigos, :subtitulo, :text
  end
end
