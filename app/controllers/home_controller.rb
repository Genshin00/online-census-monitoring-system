class HomeController < ApplicationController
  layout 'dashboard'

  def index;
    redirect_to admin_dashboard_path
  end

  def products
    redirect_to admin_dashboard_path
    @product = Product.find(params[:id])
  end

  def cart
    redirect_to admin_dashboard_path

  end

  def orders
    redirect_to admin_dashboard_path

  end

end
