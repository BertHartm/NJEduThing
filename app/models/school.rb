class School < ActiveRecord::Base
  attr_accessible :dfg, :avgclasssize, :county, :county_id, :district, :district_id, :name, :numpassing, :numstudents, :school_id, :drop_rate
end
