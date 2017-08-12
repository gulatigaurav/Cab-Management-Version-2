class CabsController < ApplicationController
  before_action :set_cab, only: [:show, :edit, :update, :destroy, :toggle_status]
before_action :authenticate_user! , except: [:show, :index, :search]
  def index
    @cabs = Cab.all
  end

  def search
     if params[:cab]

         if current_student && !current_student.address.empty? && !current_student.phone.empty?
                 @cab = Cab.near(params[:cab],10).first
                  #  binding.pry
                            if @cab
                              # render json: @cab
                              #  render partial: 'cabs/lookup'
                                  redirect_to cab_path(@cab)
                              else
                              flash[:alert] = 'No cabs found near your area.'
                              redirect_to cabs_path
                              end

        else
          flash[:alert]= 'Please update your details to continue searching cabs'
        end
     end
  end

  def show
  end

  def new
    @cab = Cab.new
  end

  def edit
  end

  def create
    @cab = Cab.new(cab_params)
    # @cxab.user = current_user
    @cab.user = current_user
    # respond_to do |format|
      if @cab.save
        # format.html { redirect_to @cab}
        redirect_to @cab
        flash[:notice] =  'Cab was successfully created.'
        # format.json { render :show, status: :created, location: @cab }
      else
       render 'new'
        # format.html { render :new }
        # format.json { render json: @cab.errors, status: :unprocessable_entity }
      end
  end

  def update
    if @cab.user == current_user
    # respond_to do |format|
          if @cab.update(cab_params)
          # format.html { redirect_to @cab }
          redirect_to @cab
          flash[:notice] = 'Cab was successfully updated.'
          else
          render 'edit'
          end
     else
        redirect_to cabs_path
        flash[:alert] = ' You can update only your cab'
     end

  end

  def destroy
      if @cab.user == current_user
        @cab.destroy
        respond_to do |format|
          format.html { redirect_to cabs_url, notice: 'Cab was successfully destroyed.' }
          format.json { head :no_content }
        end
    else
      flash[:alert] = "You can only delete your own cab."
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Cab was successfully destroyed.' }
      end
    end

  end

   def toggle_status
     if @cab.unavailable?
      @cab.available!

     elsif @cab.available?
      @cab.unavailable!
    end
   redirect_to cabs_path
   end


  private
    def set_cab
      @cab = Cab.find(params[:id])
    end

    def cab_params
      params.require(:cab).permit(:name, :reg_no, :seats, :aircond, :monthly_rental ,:source, :destination, :via)

    end
end
