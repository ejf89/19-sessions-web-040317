class StudentsController < ApplicationController

  def index
    session['user_id'] = 5
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
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


# class PublicKeysController < ApplicationController
#
#   def create
#     params[:public_key] # {user_id: , key: }
#     @public_key = PublicKey.create(params[:public_key])
#   end
#
# end
