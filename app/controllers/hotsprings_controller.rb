class HotspringsController < ApplicationController

    def index
        @seach_params = hotspring_search_params
        @hotsprings = Hotspring.search(@seach_params).paginate(page: params[:page])
    end
    
    def show
        @hotspring = Hotspring.find(params[:id])
    end

    private
        def hotspring_search_params
            params.fetch(:search, {}).permit(:name, :address, :ph, :quality)
        end

    end