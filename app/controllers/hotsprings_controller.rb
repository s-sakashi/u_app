class HotspringsController < ApplicationController

    def index
        @search_params = hotspring_search_params
        @hotsprings = Hotspring.search(@search_params)
    end
    
    def show
        @hotspring = Hotspring.find(params[:id])
    end


    private

    def hotspring_search_params
        params.fetch(:search, {}).permit(:name)
    end

end