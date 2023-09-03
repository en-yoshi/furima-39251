class ItemsController < ApplicationController
  # 未ログイン時にログインページへ遷移
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  # URL直接確認
  def edit
    return unless @item.user_id != current_user.id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :fee_status_id, :prefecture_id,
                                 :delivery_schedule_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
