class TwitsController < ApplicationController
  def index
    @twits = Twit.all.reverse_order
  end

  def new
    if params[:back]
      @twit = Twit.new(twits_params)
    else
      @twit = Twit.new
    end
  end
  
  
  def create
    @twit = Twit.new(twits_params)
    #Twit.create(twits_params)
    if @twit.save
      redirect_to twits_path, notice: "ツイートしました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def edit
    @twit = Twit.find(params[:id])
  end
  
  def update
    @twit = Twit.find(params[:id])
    @twit.update(twits_params)
    redirect_to twits_path, notice: "編集しました！"
  end
  
  def destroy
    @twit = Twit.find(params[:id])
    @twit.destroy
    redirect_to twits_path
  end
  
  def confirm
    @twit = Twit.new(twits_params)
    render :new if @twit.invalid?
  end
  
  private
  def twits_params
    params.require(:twit).permit(:content)
  end
  
end
