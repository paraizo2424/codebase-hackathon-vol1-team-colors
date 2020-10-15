class StudiedRecord < ApplicationRecord
    belongs_to :user
    has_many :square_record_subjects, dependent: :delete_all
    has_many :subject, through: :square_record_subjects
end

