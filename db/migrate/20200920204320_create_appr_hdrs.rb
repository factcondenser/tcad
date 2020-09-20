class CreateApprHdrs < ActiveRecord::Migration[6.0]
  def change
    create_table :appr_hdrs do |t|
      t.string :Run
      t.string :Date
      t.string :/
      t.string :Time, limit: 16
      t.string :File
      t.string :Description, limit: 40
      t.string :Appraisal
      t.integer :Year
      t.string :Supplement
      t.integer :Number
      t.string :Entity
      t.string :Code, limit: 10
      t.string :Entity
      t.string :Description, limit: 40
      t.string :Office
      t.string :Name, limit: 30
      t.string :Operator, limit: 20
      t.string :PACS
      t.string :Version, limit: 10
      t.string :Export
      t.string :Version, limit: 10
      t.string :Value
      t.string :Option, limit: 10
      t.string :Office
      t.string :Use
      t.string :Only, limit: 50

      t.timestamps
    end
  end
end
