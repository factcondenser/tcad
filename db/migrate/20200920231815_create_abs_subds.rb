class CreateAbsSubds < ActiveRecord::Migration[6.0]
  def change
    create_table :abs_subds do |t|
      t.string :abs_subdv_cd, limit: 10
      t.string :abs_subdv_desc, limit: 40

      t.timestamps
    end
  end
end
