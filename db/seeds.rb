# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open("schlsums.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr tsv.split('\t')
    schl = arr[2].strip
    if not schl.nil?
      x = School.new(:county_id => arr[0].strip,
                     :district_id => arr[1].strip,
                     :school_id => arr[2].strip,
                     :county => arr[3].strip,
                     :district => arr[4].strip,
                     :name => arr[5].strip,
                     :dfg => arr[6].strip,
                     :numstudents => arr[7],
                     :numpassing => arr[8])      
    else
      x = District.new(
                       #TODO: this)
      
    end
  end
end

File.open("dfgsums.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr tsv.split('\t')
    schl = arr[2].strip
    x = Dfg.new(:label => arr[0].strip,
                :passrate => arr[3].strip)
  end
end

File.open("drpout.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr tsv.split('\t')
    schl = arr[2].strip
    x = Dfg.new(:CO_CODE => arr[0].strip,
                :DIST_CODE => arr[1].strip,
                :SCH_CODE => arr[2].strip,
                :TOTDRP => arr[3].strip)
  end
end
