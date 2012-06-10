class Reporting::PunchesController < ApplicationController
  # GET /punches
  # GET /punches.xml
  def index
  	@reporting = true
    @punches = Punch
    if params[:from]
    	@punches = @punches.where("created_at > ?", params[:from])
	end
	if params[:to]
		@punches2 = @punches.where("created_at < ?", params[:to])
	end
    if params[:act]
    	@punches = @punches.tagged_with(params[:act], :as => :action)
	end
	if params[:client]
		@punches = @punches.tagged_with(params[:client], :as => :client)
	end
	if params[:project]
		@punches = @punches.tagged_with(params[:project], :as => :project)
	end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @punches }
    end
  end
end
