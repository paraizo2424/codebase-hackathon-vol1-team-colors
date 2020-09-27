class CreateSquareRecordSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :square_record_subjects do |t|
      t.int :square_record_id
      t.int :subject_id

      t.timestamps
    end
  end
end
