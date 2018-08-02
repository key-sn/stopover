class Api::StopsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create # どうやらこの記述が必要=>これはcreateアクションが飛ばされるのでは？

  def create
    stop = Stop.new(create_params)

    # エラー処理
    unless stop.save # もし、memoが保存できなかったら
      @error_message = [stop.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    end
  end

  def search
    # stop = Stop.new
    # @message = stop.number
    stop = Stop.new
    @a,@b,@c,@d = stop.sumple(params[:starttrain],params[:finishtrain],params[:isIC])
    render "search", :formats => [:json], :handlers => [:jbuilder]
  end



  private
  def create_params
    params.permit(:name) # ここに必要なparamsを記載
  end
end
