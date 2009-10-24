class SettingsController < ApplicationController
  # GET /settings/1
  # GET /settings/1.xml
  def show
    redirect_to new_setting_url and return unless Setting.current
    @setting = Setting.current

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  # GET /settings/new
  # GET /settings/new.xml
  def new
    @setting = Setting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  # GET /settings/1/edit
  def edit
    @setting = Setting.current
  end

  # POST /settings
  # POST /settings.xml
  def create
    @setting = Setting.new(params[:setting])

    respond_to do |format|
      if @setting.save
        flash[:notice] = 'Setting was successfully created.'
        format.html { redirect_to setting_url }
        format.xml  { render :xml => @setting, :status => :created, :location => @setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /settings/1
  # PUT /settings/1.xml
  def update
    @setting = Setting.current

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        flash[:notice] = 'Setting was successfully updated.'
        format.html { redirect_to setting_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.xml
  def destroy
    @setting = Setting.current
    @setting.destroy

    respond_to do |format|
      format.html { redirect_to(new_setting_url) }
      format.xml  { head :ok }
    end
  end
end
