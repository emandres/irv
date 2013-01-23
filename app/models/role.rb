class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :authorizations
  has_many :users, through: :authorizations

  def to_s
    name
  end

  def self.options_for_select(user)
    Role.all.reject { |r| user.roles.include? r }.
      sort_by { |r| r.name }.
      map { |r| [ r.name, r.id ]}
  end

end
