class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  before_action :set_admin, only: %i[ new ]


  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    # abort('hok')

    if @admin.profile.nil?
    puts 'here==============ok'
    puts request.env['omniauth.auth'].to_json
    @profile = Profile.new
    else
redirect_to admin_profile_path(@admin.id,@admin.profile.id)
    end
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to admin_profile_path(profile_params[:admin_id],@profile.id), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end
    def set_admin
      @admin = Admin.find(params[:admin_id])
    end
    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:email, :first_name, :last_name, :phone_no, :admin_id)
    end
end
