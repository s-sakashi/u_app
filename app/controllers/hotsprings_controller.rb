class HotspringsController < ApplicationController

    def index
        @hotsprings = Hotspring.paginate(page: params[:page])
    end
    
    def show
        @hotspring = Hotspring.find(params[:id])
    end


    private

    end