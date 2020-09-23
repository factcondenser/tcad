class CreateApprHdrs < ActiveRecord::Migration[6.0]
  def change
    create_table :appr_hdrs do |t|
      t.date :run_date
      t.string :file_description, limit: 40
      t.integer :appraisal_year
      t.integer :supplement_number
      t.string :entity_code, limit: 10
      t.string :entity_description, limit: 40
      t.string :office_name, limit: 30
      t.string :operator, limit: 20
      t.string :pacs_version, limit: 10
      t.string :export_version, limit: 10
      t.string :value_option, limit: 10
      t.string :office_use_only, limit: 50

      t.timestamps
    end
  end
end
