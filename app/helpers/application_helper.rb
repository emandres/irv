module ApplicationHelper
  class ActiveRecord::Base
    def self.options_for_select
      all.sort_by{ |x| x.to_s }.map { |x| [ x.to_s, x.id ]}
    end
  end
end
