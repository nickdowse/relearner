class RelearnablesController < ApplicationController
  before_action :set_relearnable, only: [:show, :edit, :update, :destroy, :after_create]
  before_action :redirect_if_logged_out
  after_action  :allow_iframe, only: [:show, :new, :create]

  # GET /relearnables
  # GET /relearnables.json
  def index
    @relearnables = current_user.relearnables.order("created_at DESC")
  end

  # GET /relearnables/1
  # GET /relearnables/1.json
  def show
  end

  # GET /relearnables/new
  def new
    @relearnable = Relearnable.new
  end

  # GET /relearnables/1/edit
  def edit
  end

  # POST /relearnables
  # POST /relearnables.json
  def create
    relearnable = current_user.relearnables.new(relearnable_params)

    respond_to do |format|
      if relearnable.save
        format.html { redirect_to relearnable, notice: 'Relearnable was successfully created.' }
        format.json { render :show, status: :created, location: relearnable }
      else
        format.html { render :new }
        format.json { render json: relearnable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relearnables/1
  # PATCH/PUT /relearnables/1.json
  def update
    respond_to do |format|
      if @relearnable.update(relearnable_params)
        format.html { redirect_to @relearnable, notice: 'Relearnable was successfully updated.' }
        format.json { render :show, status: :ok, location: @relearnable }
      else
        format.html { render :edit }
        format.json { render json: @relearnable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relearnables/1
  # DELETE /relearnables/1.json
  def destroy
    @relearnable.destroy
    respond_to do |format|
      format.html { redirect_to relearnables_url, notice: 'Relearnable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relearnable
      @relearnable = Relearnable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relearnable_params
      params.require(:relearnable).permit(:reference, :title, :summary)
    end

    def redirect_if_logged_out
      redirect_to "/users/sign_in" and return unless current_user
    end
end
