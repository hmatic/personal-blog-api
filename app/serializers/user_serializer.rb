class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :role, :post_count

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end