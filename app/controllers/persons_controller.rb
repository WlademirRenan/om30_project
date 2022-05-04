class PersonsController < ApplicationController
    before_action :set_person, only: [:show, :edit, :update]
  
    # GET /clientes
    # GET /persons.json
    def index
      @persons = Person.all
    end
  
    # GET /persons/1
    # GET /persons/1.json
    def show
    end
  
    # GET /persons/new
    def new
      @person = Person.new
    end
  
    # GET /persons/1/edit
    def edit
    end
  
    # POST /persons
    # POST /persons.json
    def create
      @person = Person.new(person_params)

      respond_to do |format|
        if @person.save
          format.html { redirect_to @person, notice: 'person was successfully created.' }
          format.json { render :show, status: :created, location: @person }
        else
          format.html { render :new }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /persons/1
    # PATCH/PUT /persons/1.json
    def update
      respond_to do |format|
        if @person.update(person_params)
          format.html { redirect_to @person, notice: 'person was successfully updated.' }
          format.json { render :show, status: :ok, location: @person }
        else
          format.html { render :edit }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = Person.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def person_params
        parameters = params.require(:person).permit(
          :name, :cpf, :cns, :email, :birthday, :phone_number, :image, :status, :address_id,
          address_attributes: [
            :zipcode, :street, :number, :neighborhood, :city, :uf, :code_ibge, :complement
          ]
        )
        parameters[:address_attributes] = address_params if params[:address]
        parameters
      end

      def address_params
        params.require(:address).permit(
          :zipcode, :street, :number, :neighborhood, :city, :uf, :code_ibge, :complement
        )
      end
  end