class StudiedRecord < ApplicationRecord
    belongs_to :user
    has_many :square_record_subject
    has_many :sunjects, through: :square_record_subject
end
