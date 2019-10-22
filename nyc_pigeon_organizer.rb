def nyc_pigeon_organizer( data )
  updated_pigeon_data = Hash.new
  # creates new hash with names as keys and blank hashes as values
  updated_pigeon_data = data.reduce({}) do |memo, (attribute, attribute_values)|
    attribute_values.each_value { |name_array| name_array.each { |name| memo[name] = Hash.new } }
    memo
  end

  # assigns blank hash values from previous block to a hash of array, with attributes as keys and values stored in array
  updated_pigeon_data.each_key { |name|
    updated_pigeon_data[name] = data.reduce({}) do |memo, (attribute, attribute_values)|
      memo[attribute] = []
      memo
    end
  }

  updated_pigeon_data.each_key { |upd_name| upd_name
    data.each_pair { |attribute, attributes_hash|
      attributes_hash.each_pair { |attribute_value, a_of_names|
        a_of_names.each { |data_name| data_name
          if upd_name == data_name
              updated_pigeon_data[upd_name][attribute].push(attribute_value.to_s)
          end
        }
      }
    }
  }



  pp updated_pigeon_data


end
