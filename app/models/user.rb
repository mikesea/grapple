class User < Sequel::Model
  one_to_many :properties

  private

  def validate
    super
    validates_unique :email
  end

end