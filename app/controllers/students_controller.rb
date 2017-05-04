class StudentsController < ApplicationController

  before_action :authorize_user, only: [:new, :edit, :update, :create]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    # only allow logged in users to see this form
    @student = Student.new
  end

  def create
    @student = Student.new( student_params(:name, :email, :dob) )
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params(:name, :email, :dob) )
    redirect_to @student
  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end
end
