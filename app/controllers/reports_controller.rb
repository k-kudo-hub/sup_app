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
      redirect_to reports_path
    else
      render :new
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to reports_path
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:client_id, :occ_time, :place_id, :genre_id, :res_id, :level_id, :content, :picture, :coping, :contact_id, :hospital, :desc_date, :desc_user, :desc_content, :count_content, :check_id).merge(user_id: current_user.id)
  end

end
