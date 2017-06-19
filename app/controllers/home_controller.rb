class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:jwt]

  def index; end

  def jtw; end
end
