class ReportsController < ApplicationController

  def index
    @report = Report.includes(:client).order("occ_time DESC")
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.valid?
      @report.save
      redirect_to :root
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:client_id, :occ_time, :place_id, :genre_id, :res_id, :level_id, :content, :picture, :coping, :contact_id, :hospital, :desc_date, :desc_user, :desc_content, :count_content, :check_id).merge(user_id: current_user.id)
  end

end
