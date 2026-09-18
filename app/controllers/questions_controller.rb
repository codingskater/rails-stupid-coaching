class QuestionsController < ApplicationController
  def ask
  end

  def answer
    question = params["question"].to_s

    if question == "I am going to work"
      @answer = "Great!"
    elsif question.end_with?("?")
      @answer = "Silly question, get dressed and go to work!"
    else
      @answer = "I don't care, get dressed and go to work!"
    end

    @conversation = session[:conversation] || []
    @conversation << { "question" => question, "answer" => @answer }

    if @answer == "Great!"
      session.delete(:conversation)
    else
      session[:conversation] = @conversation
    end
  end
end
