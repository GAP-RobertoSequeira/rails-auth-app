class RolesController < ApplicationController
  before_action :authenticate_user!, :load_app
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = @app.roles
  end

  def show; end

  def new
    @role = Role.new
  end

  def edit; end

  def create
    @role = Role.new(role_params)
    @role.app_id = @app.id

    respond_to do |format|
      if @role.save
        format.html { redirect_to [@app, @role], notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to [@app, @role], notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to app_roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :app_id)
    end

    def load_app
      @app = App.find(params[:app_id])
    end
end
