class CreateSquareRecordSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :square_record_subjects do |t|
      t.integer :studied_record_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
