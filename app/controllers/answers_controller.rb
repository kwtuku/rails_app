class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice] = "成功！"
      redirect_to("/questions/???")
    else
      flash.now[:alert] = "失敗！"
      render "questions/show"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
