class CoursesRegistrationsController < ApplicationController
  # GET /courses_registrations
  # GET /courses_registrations.xml
  def index
    @courses_registrations = CoursesRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses_registrations }
    end
  end

  # GET /courses_registrations/1
  # GET /courses_registrations/1.xml
  def show
    @courses_registration = CoursesRegistration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @courses_registration }
    end
  end

  # GET /courses_registrations/new
  # GET /courses_registrations/new.xml
  def new
    @courses_registration = CoursesRegistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @courses_registration }
    end
  end

  # GET /courses_registrations/1/edit
  def edit
    @courses_registration = CoursesRegistration.find(params[:id])
  end

  # POST /courses_registrations
  # POST /courses_registrations.xml
  def create
    @courses_registration = CoursesRegistration.new(params[:courses_registration])

    respond_to do |format|
      if @courses_registration.save
        flash[:notice] = 'CoursesRegistration was successfully created.'
        format.html { redirect_to(@courses_registration) }
        format.xml  { render :xml => @courses_registration, :status => :created, :location => @courses_registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @courses_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses_registrations/1
  # PUT /courses_registrations/1.xml
  def update
    @courses_registration = CoursesRegistration.find(params[:id])

    respond_to do |format|
      if @courses_registration.update_attributes(params[:courses_registration])
        flash[:notice] = 'CoursesRegistration was successfully updated.'
        format.html { redirect_to(@courses_registration) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @courses_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_registrations/1
  # DELETE /courses_registrations/1.xml
  def destroy
    @courses_registration = CoursesRegistration.find(params[:id])
    @courses_registration.destroy

    respond_to do |format|
      format.html { redirect_to(courses_registrations_url) }
      format.xml  { head :ok }
    end
  end
end
