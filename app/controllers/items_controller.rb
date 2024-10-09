class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :set_items_hists, only: %i[ show ]

  after_action :archive_item, only: %i[ create update destroy ]
  @@OP_CODES = {'create'=>'C', 'update'=>'U', 'destroy'=>'D'}

  def archive_item
    @item.archive(action_name, 'AR')
    #n=ItemsHist.create(items_id: @item.id, f1: @item.f1, f2: @item.f2, f3: @item.f3, items_created_at: @item.created_at, items_updated_at: ((action_name == 'destroy')? DateTime.now : @item.updated_at), op_hist: @@OP_CODES[action_name]).save!
  end


  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_hists
      @items_hists = ItemsHist.where({items_id: params[:id]})
    end

    def set_item
      @item = Item.find(params[:id]) rescue Item.new(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:f1, :f2, :f3)
    end
end
