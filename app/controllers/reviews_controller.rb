class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @review = current_user.reviews.build(review_params)
        @review_params = review_params
        if @review.save
            flash[:success] = "レビューの投稿が完了しました"
            redirect_to @hotspring
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
