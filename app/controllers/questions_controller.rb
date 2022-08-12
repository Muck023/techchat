class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def new
    @question = Question.new
  end
  def create
    Question.create(questino_params)
    redirect_to action: :index
  end
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  private
  def questino_params
    params.require(:question).permit(:title, :text, :name)
  end
end
