class QuestionsController < ApplicationController
  def index
    @test = "テストテキスト"
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "成功！"
      redirect_to("/questions/#{@question.id}")
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
