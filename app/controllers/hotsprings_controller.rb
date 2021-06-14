class HotspringsController < ApplicationController

    def index
        @hotsprings = Hotspring.search(params[:search])
    end
    
    def show
        @hotspring = Hotspring.find(params[:id])
    end


    private

    end