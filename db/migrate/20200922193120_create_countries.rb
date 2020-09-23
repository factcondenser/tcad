class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :country_cd, limit: 5
      t.string :country_name, limit: 50

      t.timestamps
    end
  end
end
