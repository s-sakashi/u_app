class HotspringsController < ApplicationController

    def show
        @hotspring = Hotspring.find(params[:id])
    end

end