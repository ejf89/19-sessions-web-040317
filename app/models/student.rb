class Student < ApplicationRecord
  INVALID_NAMES = ['dog', 'Dog']
  
  validates :name, :email, presence: true
  validates :name, exclusion: {in: INVALID_NAMES }
  validate :is_eighteen?

  has_many :courses
  has_many :students, through: :enrollments

  # make sure that the DOB is at least 18 years ago...
  # make sure that the student's name is not "dog"

  private

  def is_eighteen?
    if self.dob && self.dob >= (Date.today - 18.years)
      errors.add(:dob, "must be over eighteen years ago")
    end
  end

end
