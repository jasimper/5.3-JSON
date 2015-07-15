class Athlete < ActiveRecord::Base
  validates :sport, :weight, :height,:personal_record, :name, presence: true
end
