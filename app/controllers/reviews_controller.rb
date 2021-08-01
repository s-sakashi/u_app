class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            @hotspring = Hotspring.find(@review.hotspring_id)
            @hotspring.score = @hotspring.average_score
            @hotspring.save
            flash[:success] = "レビューの投稿が完了しました"
            redirect_to hotspring_url(@review.hotspring_id, anchor: 'review')
        else
            flash[:danger] = "投稿失敗" 
            redirect_to root_url
        end
    end

    def edit
        @review = Review.find(params[:id])
        @hotspring = @review.hotspring
    end
    
    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            flash[:success] = "更新完了"
            redirect_to hotspring_url(hotspring_id, anchor: 'review')
        else
            render 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        hotspring_id = @review.hotspring_id
        @review.destroy
        flash[:success] = "削除完了"
        redirect_to hotspring_url(hotspring_id, anchor: 'review')
    end


    private

        def review_params
            params.require(:review).permit(:star, :comment, :hotspring_id)
        end
end
