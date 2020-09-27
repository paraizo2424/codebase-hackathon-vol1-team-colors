class Subject < ApplicationRecord
    has_many :square_record_subjects
    has_many :studied_records, through: :square_record_subjects
end
