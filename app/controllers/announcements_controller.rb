class AnnouncementsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :public
  
  def public
    @announcements = Announcement.where(:public => true).order("created_at DESC")
    
    respond_to do |format|
      format.html # public_announcements.html.erb
      format.json { render :json => @announcements }
    end
  end
  
  # GET /announcements
  # GET /announcements.json
  def index
    if user_signed_in?
      @announcements = Announcement.order("created_at DESC")
    else
      @announcements = Announcement.where(:public => true).order("created_at DESC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    @announcement = Announcement.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(params[:announcement])
    @announcement.author = current_user

    respond_to do |format|
      if @announcement.save
        path = (@announcement.public ? root_path : announcements_path)
        format.html { redirect_to path, :notice => 'Announcement was successfully created.' }
        format.json { render :json => @announcement, :status => :created, :location => @announcement }
      else
        format.html { render :action => "new" }
        format.json { render :json => @announcement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        path = (@announcement.public ? root_path : announcements_path)
        format.html { redirect_to path, :notice => 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @announcement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement = Announcement.find(params[:id])
    path = (@announcement.public ? root_path : announcements_path)  
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to path }
      format.json { head :no_content }
    end
  end
end
