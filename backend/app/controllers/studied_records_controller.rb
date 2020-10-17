class StudiedRecordsController < ApplicationController
  before_action :set_studied_record, only: [:show, :update]
  before_action :authenticate_user!

  # GET /studied_records
  def index
    @studied_records = StudiedRecord.all.where(user_id: current_user.id).order(date: :asc)

    max_page_square_count = 144 #1ページのマス目の数
    squares = set_squares_object(max_page_square_count)
    pages = []

    i = 0
    @studied_records.each do |studied_record|
      studied_record.square_count.times do
        squares[i][:subject] = studied_record.subject.map{|s| s.name}
        squares[i][:color] = studied_record.subject.map{|s| s.color}
        squares[i][:studied_type] = studied_record.studied_type
        squares[i][:date] = studied_record.date
        squares[i][:note] = studied_record.note
        i += 1

        if max_page_square_count == i
          i = 0
          pages.push(squares)
          squares = set_squares_object(max_page_square_count)
        end
      end
    end
    pages.push(squares)

    # Projectテーブルヵら取得する必要があるが、コア部分の実装では
    # Projectテーブルを作成しないため、一時的にここで取得する。
    subjects = []
    Subject.all.each_with_index do |subject, i|
      subjects.push(
        {
          id: i,
          logo: subject.logo,
          name: subject.name,
          color: subject.color
        }
      )
    end

    render json: {subjects: subjects, pages: pages}
  end

  # GET /studied_records/1
  def show
    render json: @studied_record
  end

  # POST /studied_records
  def create
    studied_records = StudiedRecord.all
    increase_square_count = false
    if studied_records.exists?(user_id: current_user.id, date: params[:date])
      user_studied_records = studied_records.where(user_id: current_user.id, date: params[:date])

      user_studied_records.each do |user_studied_record|
        if user_studied_record.subject.pluck(:name) == params[:name]
          user_studied_record.square_count += 1
          user_studied_record.save!
          increase_square_count = true
          break
        end
      end
    end

    if increase_square_count
      render json: "square increase ok!"
    else
      ActiveRecord::Base.transaction do
        studied_record = StudiedRecord.new(
          user_id: current_user.id,
          date: params[:date],
          studied_type: params[:studied_type],
          square_count: 1,
          note: ""
        )
        studied_record.save!

        subject_id = Subject.find_by(name: params[:name]).id
        squaer_record_subject = SquareRecordSubject.new(
          studied_record_id: studied_record.id,
          subject_id: subject_id
        )
        squaer_record_subject.save!
      end
      render json: "square add ok!"
    end
  end

  # PATCH/PUT /studied_records/1
  def update
    if @studied_record.update(studied_record_params)
      render json: @studied_record
    else
      render json: @studied_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studied_records
  def destroy
    studied_records = StudiedRecord.where(user_id: current_user.id, date: params[:date])
    studied_records.each do |studied_record|
      if studied_record.subject.pluck(:name) == params[:name]
        ActiveRecord::Base.transaction do
          studied_record.square_count -= 1
          studied_record.save!
          if studied_record.square_count <= 0
            studied_record.destroy!
          end
        end
        break
      end
    end

    render json: 'delete ok!'
  end

  private
    def set_squares_object(max_page_square_count)
      squares = []
      max_page_square_count.times do |i|
        squares.push(
          {
            id: i,
            subject: [],
            color: [],
            studied_type: nil,
            date: nil,
            note: nil
          }
        )
      end
      squares
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_studied_record
      @studied_record = StudiedRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def studied_record_params
      params.require(:studied_record).permit(:user_id, :date, :type, :square_count, :note)
    end
end
