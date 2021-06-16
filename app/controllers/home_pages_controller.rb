class HomePagesController < ApplicationController
  def home
    @search_params = hotspring_search_params
    @hotsprings = Hotspring.search(@search_params)
  end

  def about
  end

  private

    def hotspring_search_params
        params.fetch(:search, {}).permit(:name, :ph_min, :ph_max)
    end
end
