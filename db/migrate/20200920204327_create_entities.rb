class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.integer :entity_id
      t.string :entity_cd, limit: 5

      t.timestamps
    end
  end
end
