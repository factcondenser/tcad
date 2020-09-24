class CreateApprHdrs < ActiveRecord::Migration[6.0]
  def change
    create_table :appr_hdrs do |t|
      t.date :run_date, comment: "Run Date and Time"
      t.string :file_description, limit: 40, comment: "Description of this file"
      t.integer :appraisal_year, comment: "Appraisal or Tax Year"
      t.integer :supplement_number, comment: "Supplement Number"
      t.string :entity_code, limit: 10, comment: "Entity Code or MULT if multiple entities"
      t.string :entity_description, limit: 40, comment: "Entity Description or list of entities"
      t.string :office_name, limit: 30, comment: "Office name generating file"
      t.string :operator, limit: 20, comment: "Operator generating file"
      t.string :pacs_version, limit: 10, comment: "PACS version number"
      t.string :export_version, limit: 10, comment: "Export OCX version number"
      t.string :value_option, limit: 10, comment: "If property values are not included in this tape, then this field will contain NO VALUES otherwise, it will be blank."
      t.string :office_use_only, limit: 50, comment: "Comma separated answers to all questions generating transfer file"

      t.timestamps
    end
  end
end
