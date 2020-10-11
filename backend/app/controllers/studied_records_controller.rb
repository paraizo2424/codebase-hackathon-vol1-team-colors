class StudiedRecordsController < ApplicationController
  before_action :set_studied_record, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /studied_records
  def index
    @studied_records = StudiedRecord.all.where(user_id: current_user.id)

    squares = []
    square_count = 144 #1ページのマス目の数

    square_count.times do |i|
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

    i = 0
    @studied_records.each do |studied_record|
      studied_record.square_count.times do
        squares[i][:subject] = studied_record.subject.map{|s| s.name}
        squares[i][:color] = studied_record.subject.map{|s| s.color}
        squares[i][:studied_type] = studied_record.studied_type
        squares[i][:date] = studied_record.date
        squares[i][:note] = studied_record.note
        i += 1
      end
    end

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

    render json: {subjects: subjects, squares: squares}
  end

  # GET /studied_records/1
  def show
    render json: @studied_record
  end

  # POST /studied_records
  def create
    @studied_record = StudiedRecord.new(studied_record_params)

    if @studied_record.save
      render json: @studied_record, status: :created, location: @studied_record
    else
      render json: @studied_record.errors, status: :unprocessable_entity
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

  # DELETE /studied_records/1
  def destroy
    @studied_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studied_record
      @studied_record = StudiedRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def studied_record_params
      params.require(:studied_record).permit(:user_id, :date, :type, :square_count, :note)
    end
end
