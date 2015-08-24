  # write your code here!
  # pigeon_data = {
  #       :color => {
  #         :purple => ["Theo", "Peter Jr.", "Lucky"],
  #         :grey => ["Theo", "Peter Jr.", "Ms. K"],
  #         :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
  #         :brown => ["Queenie", "Alex"]
  #       },
  #       :gender => {
  #         :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
  #         :female => ["Queenie", "Ms. K"]
  #       },
  #       :lives => {
  #         "Subway" => ["Theo", "Queenie"],
  #         "Central Park" => ["Alex", "Ms. K", "Lucky"],
  #         "Library" => ["Peter Jr."],
  #         "City Hall" => ["Andrew"]
  #       }
  #     }
#~ 2 hours + 15 minutes

def collect_list_of_names(pigeon_data)
  names_of_pigeons = []
  pigeon_data.values.map do |attribute|
    attribute.values.each do |names|
      names_of_pigeons << names
    end
  end
  names_of_pigeons.flatten.uniq
end

def nyc_pigeon_organizer(pigeon_data)
  names = collect_list_of_names(pigeon_data)
  pigeon_list = Hash.new
  #pigeon_list = {} right now
  names.each_with_object(pigeon_list) do |name, pigeon_list|
    pigeon_list[name] = {:color => [], :gender => [], :lives => []}
  end

  #getting the colors of each pigeon method
  get_color_of_pigeon(pigeon_data,pigeon_list)

  #getting the gender of each pigeon method
  get_gender_of_pigeons(pigeon_data, pigeon_list)

  #getting where the pigeon lives method
  get_homes_of_pigeon(pigeon_data, pigeon_list)
end

def get_color_of_pigeon(pigeon_data, pigeon_list)
  pigeon_list.each do |name|
    pigeon = name[0]
    pigeon_name = name[1] 
    # name =  ["Theo", {:color=>[], :gender=>[], :lives=>[]}]
      pigeon_data[:color].each do |color|
        names_array = color[1] 
       # color = [:purple, ["Theo", "Peter Jr.", "Lucky"]]
         if names_array.include?(pigeon)
            pigeon_name[:color] << "#{color[0]}"
         end
      end
  end
end

def get_gender_of_pigeons(pigeon_data,pigeon_list)
  pigeon_list.each do |name|
    pigeon = name[0]
    pigeon_name = name[1] 
    # name =  ["Theo", {:color=>[], :gender=>[], :lives=>[]}]
      pigeon_data[:gender].each do |gender|
        names_array = gender[1] 
       # gender = [:male, ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"]]
         if names_array.include?(pigeon)
            pigeon_name[:gender] << "#{gender[0]}"
         end
      end
  end
end

def get_homes_of_pigeon(pigeon_data, pigeon_list)
  pigeon_list.each do |name|
    pigeon = name[0]
    pigeon_name = name[1] 
    # name =  ["Theo", {:color=>[], :gender=>[], :lives=>[]}]
      pigeon_data[:lives].each do |lives|
        names_array = lives[1] 
       # lives = ["Subway", ["Theo", "Queenie"]]
         if names_array.include?(pigeon)
            pigeon_name[:lives] << "#{lives[0]}"
         end
      end
  end
end



