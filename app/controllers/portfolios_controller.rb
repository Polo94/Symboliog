class PortfoliosController < ApplicationController
layout "portfolio"

  def index
    @portfolio_items = Portfolio.all
    @page_title = "Our Portfolio"
  end

  def javascript
    @javascript_portfolio_items = Portfolio.javascript
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Your portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
    @page_title = @portfolio_item.title
  end

  def destroy
    #Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    #Delete/destroy the record
    @portfolio_item.destroy

    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      technologies_attributes: [:name]
    )
  end

end
