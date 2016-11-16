class BarberServicesController < ApplicationController
  before_action :find_barber_service, only: [:update, :destroy]
  before_action :find_barber, only: [:update, :destroy, :create]
  before_action :find_service, only: [:create, :update]


  def new
    @barberservice = BarberService.new
  end

  def create
    @barberservice = BarberService.new(barberservice_params)
    @barberservice.service_id = @service.id
    @barberservice.name = @service.name
    @barberservice.barber = @barber
    @barberservice.save!
    redirect_to edit_barber_path(@barber)
  end

  def update
    @barberservice.service_id = @service.id
    @barberservice.barber = @barber
    @barberservice.name = @service.name
    @barberservice.save!
    redirect_to barber_path(@barber)
  end

  def destroy
    @barberservice.destroy
    redirect_to barber_path(@barber)
  end

  private

  def barberservice_params
    params.require(:barber_service).permit(:price, :duration, :service_id, :barber_id)
  end

  def find_barber_service
    @barberservice = BarberService.find(params[:id])
  end

  def find_service
    @service = Service.find(params["barber_service"][:service_id])
  end

  def find_barber
    @barber = Barber.find(params[:barber_id])
  end

end
