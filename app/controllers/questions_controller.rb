class QuestionsController < ApplicationController
  def index
    @test = "テストテキスト"
  end

  def new
    @new = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "成功！"
      redirect_to("/questions/new")
    else
      flash.now[:alert] = "失敗！"
      render("questions/new")
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
