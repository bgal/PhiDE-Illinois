class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    authorize! :read, @event

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    authorize! :create, @event

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    authorize! :update, @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    authorize! :create, @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    authorize! :update, @event

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to events_path, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    authorize! :destroy, @event
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def load
    authorize! :read, :events
    @events = Event.where(:start_at => Time.at(params[:start].to_i).to_date..Time.at(params[:end].to_i).to_date)
    @ret = [ ]
    @events.each do |event|
      options = {:title => event.title, :start => event.start_at, :end => event.end_at, :url => event_path(event) }
      options[:color] = '#FF0000' if event.mandatory
      @ret.push(options)
    end
    respond_to do |format|
      format.json { render :json => @ret }
    end
  end
end
