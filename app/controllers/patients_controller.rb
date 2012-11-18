class PatientsController < ApplicationController

  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @patient.update_column(:view_count, @patient.view_count + 1)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  def edit
    @patient = Patient.find(params[:id])

    if @patient.user_id != current_user.id
      redirect_to patients_url, notice: 'You can only edit your info'
    end
  end

  def create
    @patient = Patient.new(params[:patient])
    @patient.view_count = 0
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
