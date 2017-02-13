class CreateVotosPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :votos_posts do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :votoPost

      t.timestamps
    end
  end
end
