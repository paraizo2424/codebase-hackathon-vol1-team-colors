class StudiedRecord < ApplicationRecord
    belongs_to :user
    has_many :square_record_subjects
    has_many :subject, through: :square_record_subjects
end
