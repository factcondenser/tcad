class CreateStateCds < ActiveRecord::Migration[6.0]
  def change
    create_table :state_cds do |t|
      t.string :state_cd, limit: 10, comment: "CAD State Property Tax Code"
      t.string :state_cd_description, limit: 50, comment: "CAD State Property Tax Code Description"
      t.string :ptd_state_cd, limit: 10, comment: "PTD State Property Tax Code"
      t.string :ptd_state_cd_description, limit: 50, comment: "PTD State Property Tax Code Description"
      t.string :state_cd_year, limit: 5, comment: "CAD State Property Tax Code Year"

      t.timestamps
    end
  end
end
