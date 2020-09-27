class StudiedRecordsController < ApplicationController
  before_action :set_studied_record, only: [:show, :update, :destroy]

  # GET /studied_records
  def index
    @studied_records = StudiedRecord.all

    render json: @studied_records
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
