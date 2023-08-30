class ItemsController < ApplicationController
  # 未ログイン時にログインページへ遷移
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  # newアクションを定義する
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :fee_status_id, :prefecture_id,
                                 :delivery_schedule_id, :price).merge(user_id: current_user.id)
  end
end
