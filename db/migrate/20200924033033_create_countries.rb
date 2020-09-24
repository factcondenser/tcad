class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :country_cd, limit: 5, comment: "Country Code"
      t.string :country_name, limit: 50, comment: "Country Name (or Description"

      t.timestamps
    end
  end
end
