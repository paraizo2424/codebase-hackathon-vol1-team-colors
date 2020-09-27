class SquareRecordSubject < ApplicationRecord
    belongs_to :studied_record
    belongs_to :subject
end
