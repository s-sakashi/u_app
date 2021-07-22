class HomePagesController < ApplicationController
  def home
    @search_params = hotspring_search_params
    @hotsprings = Hotspring.search(@search_params)
    @top_three_hotsprings = Hotspring.all.order(score: "DESC").take(3)
  end

  def about
  end

  private

    def hotspring_search_params
        params.fetch(:search, {}).permit(:name, :address, :ph_min, :ph_max)
    end
end
