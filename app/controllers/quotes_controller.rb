class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.ordered
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.company = set_quote_company

    if @quote.save
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end

  private

  def set_quote_company
    @quote_company = current_user.company
  end

end
