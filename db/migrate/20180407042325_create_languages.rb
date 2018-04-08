class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :code, null: false

      t.timestamps
    end
  end
end
