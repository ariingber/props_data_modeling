class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
    redirect_to @answer
    else
    render 'new'
    end

  end


  def show
    @answer = Answer.find params[:id]      

  end
end
private
def answer_params
  params.require(:answer).permit(:choice)

end