class ReportsController < ApplicationController
before_action :set_report, only: [:show, :edit, :update, :destroy]
before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @report = Report.includes(:client).page(params[:page]).per(10).order("occ_time DESC")
    @report_month = Report.where(occ_time: Time.current.all_month)
    respond_to do |format|
      format.html
      format.csv do
        filename = ERB::Util.url_encode('this-month-report.csv')
        send_data render_to_string, filename: filename, type: :csv
      end
    end
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
    respond_to do |format|
      format.html
      format.csv do
        filename = ERB::Util.url_encode('report.csv')
        send_data render_to_string, filename: filename, type: :csv
      end
    end
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to reports_path
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:client_id, :occ_time, :place_id, :genre_id, :res_id, :level_id, :content, :picture, :coping, :contact_id, :hospital, :desc_date, :desc_user, :desc_content, :count_content, :check_id).merge(user_id: current_user.id)
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def move_to_index
    if (current_user.id != @report.user_id) && (current_user.position_id < 4) && ([5,6,7,11].exclude?(current_user.qualification_id))
      redirect_to root_path
    end
  end
end
