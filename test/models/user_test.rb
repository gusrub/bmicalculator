require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = build(:user)
  end

  test "user is valid with all info" do
    assert @user.valid?
  end

  test "validates first name" do
    validates_presence(:first_name)
  end

  test "validates last name" do
    validates_presence(:last_name)
  end

  test "validates email" do
    validates_presence(:email)
    validates_uniqueness(:email, @user.email)
  end

  test "validates password" do
    validates_presence(:password)
  end

  test "validates date of birth" do
    validates_presence(:dob)
    validates_date(:dob)
  end

  test "validates gender" do
    validates_presence(:gender)
    validates_inclusion(:gender, User.genders.keys)
  end

  test "validates role" do
    validates_presence(:role)
    validates_inclusion(:role, User.roles.keys)
  end

end
