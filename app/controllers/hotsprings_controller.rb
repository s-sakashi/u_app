class HotspringsController < ApplicationController

    def index
        @search_params = hotspring_search_params
        @hotsprings = Hotspring.search(@search_params)
    end
    
    def show
        query = "SELECT * FROM reviews WHERE hotspring_id = ? ORDER BY user_id = ? DESC"
        @hotspring = Hotspring.find(params[:id])
        @reviews = Review.find_by_sql([query, @hotspring.id, current_user.id])
                            .first(3)
        if posted_review?(@hotspring.id)
            @review = Review.find_by(hotspring_id: @hotspring.id, user_id: current_user.id)
        else
            @review = current_user.reviews.build if logged_in?
        end
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

    def reviews
        @hotspring = Hotspring.find(params[:hotspring_id])
        @review = current_user.reviews.build if logged_in?
        query = "SELECT * FROM reviews WHERE hotspring_id = ? ORDER BY user_id = ? DESC"
        @reviews = Review.paginate_by_sql(
            [query, @hotspring.id, current_user.id],
             :page => @page, :per_page => @per_page)
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