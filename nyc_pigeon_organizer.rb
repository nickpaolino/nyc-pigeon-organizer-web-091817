require "pry"

def nyc_pigeon_organizer(data)
  pigeon_data = {}
  pigeon_names = []
  # Collect the names of each pigeon
  data.each do |trait, types|
    pigeon_names << types.values
    pigeon_names.flatten!
    pigeon_names.uniq!
  end
  # Create an empty hash for each trait under each name
  pigeon_names.each do |name|
    pigeon_data[name] = {
      :color => [],
      :gender => [],
      :lives => []
    }
  end
  # Iterates down to the lowest level to add the traits under each name
  data.each do |trait, types|
    types.each do |type, names|
      names.each do |name|
        pigeon_data[name][trait] << type.to_s
      end
    end
  end
  # Returns the new hash
  pigeon_data
end
