class AddLocations < ActiveRecord::Migration
  def up
    %q{
      Best Western Plus Willmar,45.1239,-95.0153111
      Bill Taunton Stadium,45.1082575,-95.0725785
      Dorothy Olson Aquatic Center,45.1060097,-95.0720438
      Glacial Lakes State Trail,45.1486235,-95.0036636
      The Goodness,45.121317,-95.047852
      Heritage Plaza,45.1212703,-95.0445687
      Jennie-O Turkey Store Corporate Office,45.110188,-95.078988
      Kandi Mall,45.1061989,-95.0407198
      Kandiyohi County Area Family YMCA,45.1132587,-95.0235652
      Kandiyohi County Health & Human Services,45.1481074,-95.015282
      Kandiyohi County Office Building,45.121956,-95.048281
      MinnWest Technology Campus,45.1416,-95.019363
      Rice Park,45.115236,-95.044428
      Ridgewater College,45.139354,-95.072286
      Robbins Island Park,45.131814,-95.033816
      Selvig International Park,45.12,-95.04722
      Super 8 Willmar,45.0964767,-95.0420514
      Swansson Field Recreational Complex,45.1109079,-95.0715583
      Willmar Area Learning Center,45.118297,-95.053143
      Willmar Community Education & Recreation,45.114483,-95.058741
      Willmar Lakes Area Convention & Visitors Bureau,45.1240765,-95.0145459
      Willmar Public Library,45.120018,-95.049215
    }.split("\n").each do |location|
      location.split(',').tap do |l|
        next unless l.length == 3
        BikeRack.create!(name: l[0].strip, latitude: l[1], longitude: l[2])
      end
    end
  end
  def down
    BikeRack.destroy_all
  end
end
