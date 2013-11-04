class Property < Sequel::Model
  many_to_one :user

  private

  def validate
    super
    validates_presence :user
  end

end