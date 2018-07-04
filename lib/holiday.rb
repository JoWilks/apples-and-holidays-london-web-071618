require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash.each  {|season, holiday|
    holiday.each {|holiday,curr_supplies| 
      if (holiday == :christmas || holiday == :new_years)
        curr_supplies << supply
      end
    }
  }

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each  {|season, holiday|
    holiday.each {|holiday,curr_supplies| 
      if (holiday == :memorial_day)
        curr_supplies << supply
      end
    }
  }

    
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  
  holiday_hash[season][holiday_name] = supply_array
  
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)

  holiday_hash[:winter].values.flatten!
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each { |season, holiday| 
    puts "#{season.capitalize}:"
      holiday.each { |name, supplies| 
        
          if name.to_s.include? "_"
            mod_name = name.to_s.split('_')
            mod_name2 = []
              mod_name.each {|word| mod_name2 << word.capitalize }
            puts "  #{mod_name2.join(" ")}: #{supplies.join(", ")}"
          else
            puts "  #{name.capitalize}: #{supplies.join(", ")}"
          end
    }
  }
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_hol = []
  holiday_hash.each { |season,holiday| 
    holiday.each { |holiday, supplies| 
      supplies.each {|supply|
        if supply == "BBQ"
          bbq_hol << holiday
        end
      }
    }
  }
  bbq_hol
  
end







