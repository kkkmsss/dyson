class CleansController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    
    def index
    end

    def sindan
    end

    def kensaku

      if params[:search] == nil

        @cleans = Clean.all

      elsif params[:search] == ''

        @cleans = Clean.all

      else

        @cleans = Clean.where("maker LIKE ? OR name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      end
    end

    def new

      @clean = Clean.new
    end
  
    def create

      clean = Clean.new(clean_params)
      clean.user_id = current_user.id

      if clean.save

        Rails.logger.info "投稿成功"
        redirect_to :action => "kensaku"

      else

        Rails.logger.info "投稿失敗"
        redirect_to :action => "new"
      end
    end

    def show

      @clean = Clean.find_by(id: params[:id])

      if @clean

        @comments = @clean.comments
        @comment = Comment.new

      else
        redirect_to cleans_path, alert: "投稿が見つかりませんでした"
      end
    end

    def destroy

      clean = Clean.find(params[:id])

      redirect_to action: :kensaku
      clean.destroy
    end
    
    private
    def clean_params

      params.require(:clean).permit(:maker, :genre, :cost, :name, :about, :image, :overall, :light, :power, :care, :time, :tag_ids)
    end
end