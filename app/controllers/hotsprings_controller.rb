class HotspringsController < ApplicationController

    def index
        @search_params = hotspring_search_params
        @hotsprings = Hotspring.search(@search_params)
    end
    
    def show
        @hotspring = Hotspring.find(params[:id])
    end

    def new
        @hotspring = Hotspring.new(params[:hotspring])
    end

    def create
        @hotspring = Hotspring.new(hotspring_params)
        if @hotspring.save
            redirect_to root_url
        else
            render 'new'
        end
    end


    private

        def hotspring_params
        params.require(:hotspring).permit(:name, :address, :quality,
                        :ph)
        end

        def hotspring_search_params
            params.fetch(:search, {}).permit(:name, :address, :ph_min, :ph_max)
        end
    

end