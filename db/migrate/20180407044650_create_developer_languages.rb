class CreateDeveloperLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_languages do |t|
      t.belongs_to :developer, index: true
      t.belongs_to :language, index: true
    end

    add_index :developer_languages, [:developer_id, :language_id], unique: true, name: 'index_developer_language_unique'
  end
end