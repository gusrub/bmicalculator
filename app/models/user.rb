class User < ApplicationRecord

  include Concerns::Paginable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

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
  validates :dob, presence: true
  validate :valid_dob
  validates :gender, inclusion: { in: genders.keys }
  validates :role, inclusion: { in: roles.keys }

  before_validation :apply_default_role

  scope :search, ->(term) { where("email ILIKE ? OR first_name ILIKE ? OR last_name ILIKE ?", "%#{term}%", "%#{term}%", "%#{term}%") }

  def full_name
    "#{first_name} #{last_name}".strip
  end

  private

  def apply_default_role
    self.role = User.roles[:visitor] unless role.present?
  end

  def valid_dob
    begin
      Date.parse(dob.try(:to_s) || "")
    rescue ArgumentError => e
      errors.add(:dob, :format, message: "is an invalid date")
    end
  end

end
