class QuestionsController < ApplicationController
  def index
    @test = "テストテキスト"
  end

  def new
    @new = Question.new
  end
end
