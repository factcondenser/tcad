class CreateStateCds < ActiveRecord::Migration[6.0]
  def change
    create_table :state_cds do |t|
      t.string :state_cd, limit: 10
      t.string :state_cd_description, limit: 50
      t.string :ptd_state_cd, limit: 10
      t.string :ptd_state_cd_description, limit: 50
      t.string :state_cd_year, limit: 5

      t.timestamps
    end
  end
end
