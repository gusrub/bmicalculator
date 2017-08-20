require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Devise::Test::IntegrationHelpers

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_in_valid_user
    user = create(:user)
    user.confirm
    sign_in user
  end

  def validates_presence(attribute)
    instance_name = self.class.name.gsub(/Test/, '').underscore.to_sym
    instance = build(instance_name)
    instance.send("#{attribute}=", nil)
    refute instance.valid?
    assert_not_empty instance.errors[attribute.to_sym]
  end

  def validates_date(attribute)
    instance_name = self.class.name.gsub(/Test/, '').underscore.to_sym
    instance = build(instance_name)
    instance.send("#{attribute}=", "invalid")
    refute instance.valid?
    assert_not_empty instance.errors[attribute.to_sym]
  end

  def validates_inclusion(attribute, items)
    instance_name = self.class.name.gsub(/Test/, '').underscore.to_sym
    instance = build(instance_name)
    instance.send("#{attribute}=", nil)
    refute instance.valid?
    assert_not_includes items, instance.send(attribute.to_sym)
    assert_not_empty instance.errors[attribute.to_sym]
  end

  def validates_numericality(attribute, **options)
    instance_name = self.class.name.gsub(/Test/, '').underscore.to_sym
    instance = build(instance_name)
    instance.send("#{attribute}=", nil)
    refute instance.valid?
    assert_not_kind_of Numeric, instance.send(attribute.to_sym)

    if options.has_key? :greater_than_or_equal_to
      instance.send("#{attribute}=", options[:greater_than_or_equal_to]-1)
      refute instance.valid?
    end

    assert_not_empty instance.errors[attribute.to_sym]
  end

  def validates_belongs_to(relation)
    instance_name = self.class.name.gsub(/Test/, '').underscore.to_sym
    instance = build(instance_name)
    assert_respond_to instance, relation.to_sym
    relation_instance = instance.send("build_#{relation}")
    assert_kind_of relation.to_s.capitalize.constantize, relation_instance
  end

  def validates_uniqueness(attribute, unique_value)
    instance_name = self.class.name.gsub(/Test/, '').underscore.to_sym
    instance = build(instance_name)
    instance.send("#{attribute}=", unique_value)
    create(instance_name.to_sym, {attribute.to_s => unique_value})
    refute instance.valid?
    assert_not_empty instance.errors[attribute.to_sym]
  end

end

class MiniTest::Spec
  ActiveRecord::Migration.check_pending!
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.logger = Rails.logger

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
