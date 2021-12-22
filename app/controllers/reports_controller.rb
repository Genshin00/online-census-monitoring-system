class ReportsController < ApplicationController
  def printable_household_form
    @household = Household.find(params[:id])
  end

  def certificate_of_appearance

  end
end
