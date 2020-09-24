class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.integer :entity_id, comment: "Entity id"
      t.string :entity_cd, limit: 5, comment: "Entity Code"

      t.timestamps
    end
  end
end
