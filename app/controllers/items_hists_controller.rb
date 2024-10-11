class ItemsHistsController < ApplicationController
  before_action :set_items_hist, only: %i[ show edit update destroy ]

  # GET /items_hists or /items_hists.json
  def index
    @items_hists = ItemsHist.all
  end

  # GET /items_hists/1 or /items_hists/1.json
  def show
  end

  # GET /items_hists/new
  def new
    @items_hist = ItemsHist.new
  end

  # GET /items_hists/1/edit
  def edit
  end

  # POST
  def tag
    @items_hist = ItemsHist.find(params[:id])
    @item = Item.find(@items_hist.items_id) rescue Item.new

    br = ItemsBranch.new
    br.items_hist_id = @items_hist.id
    br.item_id       = @items_hist.items_id
    br.refid         = params[:refid] || '??'
    br.reftype       = "tag"

    respond_to do |format|
      if br.save
        format.html { redirect_to @item, notice: "Items hist was successfully created." }
        format.json { render :show, status: :created, location: @items_hist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @items_hist.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /items_hists or /items_hists.json
  def checkout
    @items_hist = ItemsHist.find(params[:id])

    @item = Item.find(@items_hist.items_id) rescue Item.new
    if @item.id.blank?
      replay_action = 'create'
      @item.id = @items_hist.items_id
    else
      replay_action = 'update'
    end

    @item.f1 = @items_hist.f1
    @item.f2 = @items_hist.f2
    @item.f3 = @items_hist.f3


    respond_to do |format|
      if @item.save
        @items_hist.create_or_move_head
        format.html { redirect_to @item, notice: "Items hist was successfully created." }
        format.json { render :show, status: :created, location: @items_hist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @items_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /items_hists or /items_hists.json
  def create
    @items_hist = ItemsHist.new(items_hist_params)

    respond_to do |format|
      if @items_hist.save
        format.html { redirect_to @items_hist, notice: "Items hist was successfully created." }
        format.json { render :show, status: :created, location: @items_hist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @items_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_hists/1 or /items_hists/1.json
  def update
    respond_to do |format|
      if @items_hist.update(items_hist_params)
        format.html { redirect_to @items_hist, notice: "Items hist was successfully updated." }
        format.json { render :show, status: :ok, location: @items_hist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @items_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_hists/1 or /items_hists/1.json
  def destroy
    @items_hist.destroy!

    respond_to do |format|
      format.html { redirect_to items_hists_path, status: :see_other, notice: "Items hist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_hist
      @items_hist = ItemsHist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def items_hist_params
      params.require(:items_hist).permit(:items_id, :f1, :f2, :f3, :items_created_at, :items_updated_at, :op_hist)
    end
end
