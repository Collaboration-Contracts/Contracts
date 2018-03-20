class ContractsController < ApplicationController
  # include HomeHelper
  protect_from_forgery with: :exception

  def index
    @page_title = "Dashboard"
    render 'dashboard'
  end

  def new
    @page_title = "Collaboration Contracts"
    @contract = Contract.new
  end

  def create
    @contract = current_user.contracts.new(contract_params)
    if @contract.save
      flash[:confirmation_message] = "Yay! Your contract has been saved!"
    end
    redirect_to root_path
  end

private
  def contract_params
    params.require(:contract).permit(:title, :description)
  end

end
