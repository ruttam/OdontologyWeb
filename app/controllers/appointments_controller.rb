class AppointmentsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def index
    @patient = Patient.find(params[:patient_id])
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.find(params[:id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.build(appointment_params)

    if [@appointment.date].any?(&:blank?)
      flash[:notice] = "Date can't be blank!"
      render :new
    elsif @appointment.save
      flash[:notice] = "Succesfully added an appointment"
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def appointment_params
    params.require(:appointment).permit(:date, :comment, :isUrgent)
  end

end
