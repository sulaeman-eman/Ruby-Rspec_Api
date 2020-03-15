class ItemsController < ApplicationController
    before_action :set_bookstore
  before_action :set_bookstore_item, only: [:show, :update, :destroy]

  # GET /bookstores/:bookstore_id/items
  def index
    json_response(@bookstore.items)
  end

  # GET /bookstores/:bookstore_id/items/:id
  def show
    json_response(@item)
  end

  # POST /bookstores/:bookstore_id/items
  def create
    @bookstore.items.create!(item_params)
    json_response(@bookstore, :created)
  end

  # PUT /bookstores/:bookstore_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /bookstores/:bookstore_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_bookstore
    @bookstore = Bookstore.find(params[:bookstore_id])
  end

  def set_bookstore_item
    @item = @bookstore.items.find_by!(id: params[:id]) if @bookstore
  end

end
