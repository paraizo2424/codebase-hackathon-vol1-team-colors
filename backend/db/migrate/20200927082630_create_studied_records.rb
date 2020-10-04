class CreateStudiedRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :studied_records do |t|
      t.integer :user_id
      t.date :date
      t.integer :studied_type
      t.integer :square_count
      t.text :note

      t.timestamps
    end
  end
end
