class CoursesController < ApplicationController
  skip_before_filter :super_authenticate
  before_filter :authenticate

  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.live.all(:order => "starttime, name")
    @lunch_counts = Registration.all.map(&:lunch).group_by{|lunch| lunch}
    @syllabus_counts = Registration.all.map(&:wants_syllabus).group_by{|wants_syllabus| wants_syllabus}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.xml
  def create
    params[:course]["starttime(1i)"] = '2009'
    params[:course]["starttime(2i)"] = '11'
    params[:course]["starttime(3i)"] = '14'
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:notice] = 'Course was successfully created.'
        format.html { redirect_to(@course) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.update_attributes!(:deleted_at => Time.now)

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end
end
