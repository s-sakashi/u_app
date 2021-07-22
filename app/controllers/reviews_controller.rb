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

    def destroy
    end


    private

        def review_params
            params.require(:review).permit(:star, :comment, :hotspring_id)
        end
end
