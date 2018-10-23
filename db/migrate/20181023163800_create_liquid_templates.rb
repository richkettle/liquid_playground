class CreateLiquidTemplates < ActiveRecord::Migration
  def change
    create_table :liquid_templates do |t|
      t.text :label
      t.text :body

      t.timestamps null: false
    end
  end
end
