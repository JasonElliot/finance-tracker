class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger]="Enter a Stock ticker to Search"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger]="Entered an Invalid ticker symbol" unless @stock
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end
end
