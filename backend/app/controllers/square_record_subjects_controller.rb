class SquareRecordSubjectsController < ApplicationController
  before_action :set_square_record_subject, only: [:show, :update, :destroy]

  # GET /square_record_subjects
  def index
    @square_record_subjects = SquareRecordSubject.all

    render json: @square_record_subjects
  end

  # GET /square_record_subjects/1
  def show
    render json: @square_record_subject
  end

  # POST /square_record_subjects
  def create
    @square_record_subject = SquareRecordSubject.new(square_record_subject_params)

    if @square_record_subject.save
      render json: @square_record_subject, status: :created, location: @square_record_subject
    else
      render json: @square_record_subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /square_record_subjects/1
  def update
    if @square_record_subject.update(square_record_subject_params)
      render json: @square_record_subject
    else
      render json: @square_record_subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /square_record_subjects/1
  def destroy
    @square_record_subject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_square_record_subject
      @square_record_subject = SquareRecordSubject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def square_record_subject_params
      params.require(:square_record_subject).permit(:square_record_id, :subject_id)
    end
end
