class PersonController < Patient::ApplicationController

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
    if @patient.update_attributes params[:patient]
      flash[:notice] = 'Your information is successfully updated!'
      render :show
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])

    EmailValidator.regexp


    if @patient.val == 16
      if [@patient.name, @patient.surname, @patient.personalCode, @patient.telephoneNr].any?(&:blank?)
        flash.now[:notice] = "There are empty fields!"
        render :new
      elsif @patient.personalCode.length != 11
        flash[:notice] = "Check your personal code!"
        render :new
      elsif @patient.telephoneNr.length != 9
        flash[:notice] = "Check your telephone number (must be 9 numbers)!"
        render :new
      elsif !EmailValidator.valid?(@patient.email)
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

end
