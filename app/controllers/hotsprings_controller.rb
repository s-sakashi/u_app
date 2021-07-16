class HotspringsController < ApplicationController

    def index
        @search_params = hotspring_search_params
        @hotsprings = Hotspring.search(@search_params)
    end
    
    def show
        @hotspring = Hotspring.find(params[:id])
        @review = current_user.reviews.build if logged_in?
    end

    def new
        @hotspring = Hotspring.new(params[:hotspring])
    end

    def create
        @hotspring = Hotspring.new(hotspring_params)
        # @hotspring.images[0] = 'hotspring_default_img.png'
        if @hotspring.save
            redirect_to root_url
        else
            render 'new'
        end
    end

    def edit
        @hotspring = Hotspring.find(params[:id])
    end

    def update
        @hotspring = Hotspring.find(params[:id])
        if @hotspring.update(hotspring_params)
            flash[:success] = "更新完了"
            redirect_to @hotspring
        else
            render 'edit'
        end
    end

    def destroy
        Hotspring.find(params[:id]).destroy
        flash[:success] = "削除完了"
        redirect_to root_url
    end


    private

        def hotspring_params
        params.require(:hotspring).permit(:name, :address, :quality,
                        :ph, images: [])
        end

        def hotspring_search_params
            params.fetch(:search, {}).permit(:name, :address, :ph_min, :ph_max)
        end
    

end