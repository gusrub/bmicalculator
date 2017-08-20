class User < ApplicationRecord

  enum gender: {
    male: 0,
    female: 1
  }

  enum role: {
    visitor: 0,
    admin: 1
  }

  has_many :measurements, dependent: :destroy, autosave: true

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :dob, presence: true
  validate :valid_dob
  validates :gender, inclusion: { in: genders.keys }
  validates :role, inclusion: { in: roles.keys }

  def full_name
    "#{first_name} #{last_name}".strip
  end

  private

  def valid_dob
    begin
      Date.parse(dob.try(:to_s) || "")
    rescue ArgumentError => e
      errors.add(:dob, :format, message: "is an invalid date")
    end
  end

end
