# frozen_string_literal: true

# SL: I think it is great that we created a new controller for this. This makes
# preferences a first-class concept of your system. A user can Create, Read,
# Update, and Delete (CRUD) a Preference, and that is our "tell" that having a
# controller to represent this resource is the right thing here.
class PreferencesController < ApplicationController
<<<<<<< HEAD
  before_action :ensure_user
  before_action :set_preference, only: [:edit, :update, :destroy]

  # GET /preferences/new
  def new
    @preference = preference.new(user_id: params[:user_id], enable_notifications: params[:enable_notifications], issue_ty: params[:issue_ty], perange1_start: params[:perange1_start], range1_end: params[:range1_end], range2_start: params[:range2_start], range2_end: params[:range2_end])
  end

  # SL: It looks like a Preference belongs to a user. This makes me think that
  # it would be more appropriate for our routes too look like this:
  # /users/10/preferences/edit
  # We can take a closer look at this URL in person: https://guides.rubyonrails.org/routing.html#nested-resources
  # GET /preferences/1/edit
  def edit
  end

  # POST /preferences
  # POST /preferences.json
  def create
    @preference = current_user.build_preference(preference_params)

    respond_to do |format|
      if @preference.save
        format.html { redirect_to root_path, notice: "preference was successfully created." }
        format.json { render :show, status: :created, location: @preference }
      else
        format.html { render :new }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # SL: It seems to me that anyone, whether they are logged in or not, and
  # whether the preference belongs to them or not, is able to edit any
  # preference. This might also be the case in other actions in this controller.
  # PATCH/PUT /preferences/1
  # PATCH/PUT /preferences/1.json
  def update
    # SL: Let's talk about what the location option is doing in the JSON
    # response.
    respond_to do |format|
      if @preference
        if @preference.update(preference_params)
          format.html { redirect_to root_path, notice: "preference was successfully updated." }
          format.json { render :show, status: :ok, location: @preference }
        else
          # 404 before_action
          format.html { render :edit }
          format.json { render json: @preference.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # SL: Both of the comments on the set_preference and preference_params methods
  # are great.
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = current_user.preference
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:enable_notifications, :issue_ty, :perange1_start, :range1_end, :range2_start, :range2_end)
    end

    def ensure_user
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end


    
end
