class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to request.referer
  end

  def edit
    #@address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
