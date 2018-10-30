class LiquidTemplatesController < ApplicationController
  before_action :set_liquid_template, only: [:show, :edit, :update, :destroy]
  before_action :set_drop

  def set_drop
    @drop = {
      "booking" => {
        "client" => {
          "first_name" => "Richard",
          "last_name" => "Kettle",
        },
        "date" => "2018-10-04T09:56:34Z",
        "address" => "2nd Floor, 3-7 Herbal Hill, Farringdon, London EC1R 5EJ",
        "time" => "14:00",
        "person" => {
          "first_name" => "Anna",
          "last_name" => "Goss"
        },
        "service" => {
          "name" => "Mortgate Appointment"
        },
        "customers" => [{
          "first_name" => "Richard",
          "last_name" => "Kettle",
          "email" => "richardlkettle@gmail.com",
          "age" => 32
        },{
          "first_name" => "Paul",
          "last_name" => "Coates",
          "email" => "pcoates@bookingbug.com",
          "age" => 55
        },{
          "first_name" => "Vinh",
          "last_name" => "Luu",
          "email" => "vluu@bookingbug.com",
          "age" => 87
        }]
      }
    }
  end

  # GET /liquid_templates
  # GET /liquid_templates.json
  def index
    @liquid_templates = LiquidTemplate.all
  end

  # GET /liquid_templates/1
  # GET /liquid_templates/1.json
  def show
  end

  # GET /liquid_templates/new
  def new
    @liquid_template = LiquidTemplate.new
  end

  # GET /liquid_templates/1/edit
  def edit
  end

  # POST /liquid_templates
  # POST /liquid_templates.json
  def create
    @liquid_template = LiquidTemplate.new(liquid_template_params)

    respond_to do |format|
      if @liquid_template.save
        format.html { redirect_to @liquid_template, notice: 'Liquid template was successfully created.' }
        format.json { render :show, status: :created, location: @liquid_template }
      else
        format.html { render :new }
        format.json { render json: @liquid_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquid_templates/1
  # PATCH/PUT /liquid_templates/1.json
  def update
    respond_to do |format|
      if @liquid_template.update(liquid_template_params)
        format.html { redirect_to @liquid_template, notice: 'Liquid template was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquid_template }
      else
        format.html { render :edit }
        format.json { render json: @liquid_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquid_templates/1
  # DELETE /liquid_templates/1.json
  def destroy
    @liquid_template.destroy
    respond_to do |format|
      format.html { redirect_to liquid_templates_url, notice: 'Liquid template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquid_template
      @liquid_template = LiquidTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquid_template_params
      params.require(:liquid_template).permit(:label, :body)
    end
end
