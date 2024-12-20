class ShopItemsController < ApplicationController
  before_action :set_shop_item, only: %i[ show edit update destroy ]

  # GET /shop_items or /shop_items.json
  def index
    @shop_items = ShopItem.all
  end

  def index
    # Use Ransack to create a search object for the model
    @q = ShopItem.ransack(params[:q])  # `params[:q]` will contain the search parameters
    @shop_items = @q.result(distinct: true)  # Apply the search query and get the results
  end

  # GET /shop_items/1 or /shop_items/1.json
  def show
  end

  # GET /shop_items/new
  def new
    @shop_item = ShopItem.new
  end

  # GET /shop_items/1/edit
  def edit
  end

  # POST /shop_items or /shop_items.json
  def create
    @shop_item = ShopItem.new(shop_item_params)
    r = SimpleRandom.new
    @shop_item.amount = r.uniform(10, 50).to_i

    respond_to do |format|
      if @shop_item.save
        format.html { redirect_to @shop_item, notice: "Shop item was successfully created." }
        format.json { render :show, status: :created, location: @shop_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def purchase
    respond_to do |format|
      if @shop_item.update(shop_item_params)
        format.html { redirect_to @shop_item, notice: "Shop item was successfully updated." }
        format.json { render :show, status: :ok, location: @shop_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_items/1 or /shop_items/1.json
  def update
    respond_to do |format|
      if @shop_item.update(shop_item_params)
        format.html { redirect_to @shop_item, notice: "Shop item was successfully updated." }
        format.json { render :show, status: :ok, location: @shop_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_items/1 or /shop_items/1.json
  def destroy
    @shop_item.destroy!

    respond_to do |format|
      format.html { redirect_to shop_items_path, status: :see_other, notice: "Shop item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_item
      @shop_item = ShopItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shop_item_params
      params.expect(shop_item: [ :name, :description, :price ])
    end
end
