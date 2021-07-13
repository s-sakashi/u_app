require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:sakashi)
    @review = @user.reviews.build(comment: "This hotspring is nice!", hotspring_id: 1)
  end

  # test "should be valid" do
  #   assert @review.valid?
  # end

  # test "associated review should be destroyed" do
  #   @user.save
  #   @user.reviews.create!(content: "Lorem ipsum", hotspring: 1)
  #   assert_difference 'Review.count', -1 do
  #     @user.destroy
  #   end
  # end
end
