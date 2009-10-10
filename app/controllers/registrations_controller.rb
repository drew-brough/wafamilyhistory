class RegistrationsController < ApplicationController
  
  skip_before_filter :super_authenticate, :only => ["index", "new", "create", "show"]
  before_filter :authenticate, :only => "index"
  
  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new(:enrollments => [Enrollment.new])
    @grouped_courses = Course.live.group_by(&:starttime)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    # @course_registration_param_sets = params[:registration].delete(:course_registrations)
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        # @course_registration_param_sets.each do |course_registration_params|
        #   CourseRegistration.create!(course_registration_params)
        # end
        flash[:notice] = 'Thank you for registering!'
        format.html { redirect_to(@registration) }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        flash[:notice] = 'Registration was successfully updated.'
        format.html { redirect_to(@registration) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end
end
