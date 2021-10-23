class PatientsController < ApplicationController

  def index
    @patient = Patient.find(params[:id])
    render :edit
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
    render :edit
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:notice] = 'Your information is successfully updated!'
      render :create
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    EmailValidator.regexp


    if @patient.val == 16
      if [@patient.name, @patient.surname, @patient.personalCode, @patient.telephoneNr].any?(&:blank?)
        flash.now[:notice] = "There are empty fields!"
        render :new
      elsif !EmailValidator.valid?(@patient.second_email)
        flash[:notice] = "Bad email format!"
        render :new
        flash.discard
      elsif @patient.save
        flash.now[:notice] = "You have registered successfully!"
      end
    else
      flash.now[:notice] = "Wrong validation number 2*8="
      render :new
    end

  end

  private
  def patient_params
    params.require(:patient).permit(:name, :surname, :personalCode, :telephoneNr, :second_email, :address, :val)
  end

end
