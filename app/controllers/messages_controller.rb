class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    EmailValidator.regexp

    if @message.val == 6
      if [@message.sender, @message.email, @message.msg, @message.val].any?(&:blank?)
        flash.now[:notice] = "There are empty fields"
        render :new
      elsif @message.msg.length < 10
        flash[:notice] = "Too few characters"
        render :new
      elsif !EmailValidator.valid?(@message.email)
        flash[:notice] = "Bad email format"
        render :new
        flash.discard
      elsif @message.save
        redirect_to new_message_path
      end
    else
      flash.now[:notice] = "Wrong validation number 2*3="
      render :new
    end

  end

  private
  def message_params
    params.require(:message).permit(:sender, :email, :msg, :val)
  end

end
