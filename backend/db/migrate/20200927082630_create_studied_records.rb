class CreateStudiedRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :studied_records do |t|
      t.int :user_id
      t.date :date
      t.int :type
      t.int :square_count
      t.text :note

      t.timestamps
    end
  end
end
