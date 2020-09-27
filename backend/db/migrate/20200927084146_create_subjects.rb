class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :logo
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
