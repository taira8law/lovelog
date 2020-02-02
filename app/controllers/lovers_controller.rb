class LoversController < ApplicationController
  def index
    puts params[:id] #デバッグ用
    @lovers = current_user.lovers.order(id: :desc).page(params[:page])
  end

  def show
    @lover = Lover.find(params[:id])
    @activity = current_user.activities.build
  end

  def new
    @lover = Lover.new
  end

  def create
    @lover = current_user.lovers.build(lover_params)
    puts 'ここをみろ'

    if @lover.save
      flash[:success] = '恋人を登録しました。'
      redirect_to @lover
    else
      flash.now[:danger] = '恋人の登録に失敗しました。'
      render :new
    end
  end

  def update
    @lover = Lover.find(params[:id])
    
    if @lover.update(lover_params)
      flash[:success] = '恋人は正常に更新されました。'
      redirect_to @lover
    else
      flash.now[:danger] = '恋人の更新に失敗しました。'
      render :new
    end
  end

  def edit
    puts params[:id] #デバッグ用
    @lover = Lover.find(params[:id])
  end
  
  def destroy
    @lover = Lover.find(params[:id])
    @lover.destroy
    
    flash[:success] = '恋人は正常に削除されました'
    redirect_to lovers_path
  end
  
  private
    
  def lover_params
    params.require(:lover).permit(:name, :status)
#    lover_params.user_id = session[:user_id]
  end
end