class ItemsBranchesController < ApplicationController
  before_action :set_items_branch, only: %i[ show edit update destroy ]

  # GET /items_branches or /items_branches.json
  def index
    @items_branches = ItemsBranch.all
  end

  # GET /items_branches/1 or /items_branches/1.json
  def show
  end

  # GET /items_branches/new
  def new
    @items_branch = ItemsBranch.new
  end

  # GET /items_branches/1/edit
  def edit
  end

  # POST /items_branches or /items_branches.json
  def create
    @items_branch = ItemsBranch.new(items_branch_params)

    respond_to do |format|
      if @items_branch.save
        format.html { redirect_to @items_branch, notice: "Items branch was successfully created." }
        format.json { render :show, status: :created, location: @items_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @items_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_branches/1 or /items_branches/1.json
  def update
    respond_to do |format|
      if @items_branch.update(items_branch_params)
        format.html { redirect_to @items_branch, notice: "Items branch was successfully updated." }
        format.json { render :show, status: :ok, location: @items_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @items_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_branches/1 or /items_branches/1.json
  def destroy
    item_id = @items_branch.item_id
    @items_branch.destroy!

    respond_to do |format|
      format.html { redirect_to item_path(item_id), status: :see_other, notice: "Items branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_branch
      @items_branch = ItemsBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def items_branch_params
      params.require(:items_branch).permit(:items_hist_id, :refid)
    end
end
