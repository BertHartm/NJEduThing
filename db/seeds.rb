# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open("db/schlsums.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr = tsv.split("\t")
    arr.each do |item|
      # strip leading and trailing "
      item.replace(item.chomp('"').reverse.chomp('"').reverse)
    end
    schl = arr[2].strip
    if not schl.nil?
      x = School.new(:county_id => arr[0].strip,
                     :district_id => arr[1].strip,
                     :school_id => arr[2].strip,
                     :county => arr[3].strip,
                     :district => arr[4].strip,
                     :name => arr[5].strip,
                     #:dfg => arr[6].strip,
                     :numstudents => arr[7],
                     :numpassing => arr[8])
    else
      x = District.new(:county_id => arr[0].strip,
                       :district_id => arr[1].strip,
                       :county => arr[3].strip,
                       :district => arr[4].strip,
                       :dfg => arr[6].strip,
                       :numstudents => arr[7],
                       :numpassing => arr[8])
    end
  end
end

File.open("db/dfgsums.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr = tsv.split("\t")
    arr.each do |item|
      # strip leading and trailing "
      item.replace(item.chomp('"').reverse.chomp('"').reverse)
    end
    x = Dfg.new(:label => arr[0].strip,
                :passrate => arr[3].strip)
  end
end

File.open("db/drpout.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr = tsv.split("\t")
    arr.each do |item|
      # strip leading and trailing "
      item.replace(item.chomp('"').reverse.chomp('"').reverse)
    end
    county_id = arr[0].strip
    district_id = arr[1].strip
    school_id = arr[2].strip
    school = School.where("county_id = " + county_id + " and district_id = " + district_id + " and school_id = " + school_id)
    school.update(:drop_rate => arr[3].strip)
  end
end

File.open("db/classsize.txt") do |f|
  f.readline()
  f.each_line do |tsv|
    tsv.chomp!
    arr = tsv.split("\t")
    arr.each do |item|
      # strip leading and trailing "
      item.replace(item.chomp('"').reverse.chomp('"').reverse)
    end
    county_id = arr[0].strip
    district_id = arr[1].strip
    school_id = arr[2].strip
    school = School.where("county_id = " + county_id + " and district_id = " + district_id + " and school_id = " + school_id)
    school.update(:avgclasssize => arr[3].strip)
  end
end

File.open("db/drpout.txt") do |f|
  f.readline() # skip the first line (headers)
  f.each_line do |tsv|
    tsv.chomp!
    arr = tsv.split("\t")
    arr.each do |item|
      # strip leading and trailing "
      item.replace(item.chomp('"').reverse.chomp('"').reverse)
    end
    county_id = arr[0].strip
    district_id = arr[1].strip
    school_id = arr[2].strip
    school = School.where("county_id = " + county_id + " and district_id = " + district_id + " and school_id = " + school_id)
    school.update(:drop_rate => arr[3].strip)
  end
end
