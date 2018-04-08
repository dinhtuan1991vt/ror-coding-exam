class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_programming_languages do |t|
      t.belongs_to :developer, index: true
      t.belongs_to :programming_language, index: true
    end

    add_index :developer_programming_languages, [:developer_id, :programming_language_id], unique: true, name: 'index_developer_programming_language_unique'
  end
end