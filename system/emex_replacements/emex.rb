require 'rubygems'
require 'nokogiri'
require 'ruby-debug'
require 'fastercsv'
require 'rails'

# Группы деталей:
# 1 - Original - Оригинальные детали
# 2 - NewNumber - Новые номера искомой детали
# 3 - ReplacementOriginal - Оригинальные замены
# 4 - ReplacementNonOriginal - Неоригинальные замены
# 5 - PartOfDetail - Деталь узла (являются частью какой-либо детали)
# 6 - DetailParts - Части искомой детали
group_ids = ["1", "2", "3", "4"]
emex_responses = '../emex/'
files = Dir.glob(emex_responses + "5*")

FasterCSV.open("./file.csv", "w") do |csv|
  files.each do |file_name|
    replacements = {}
    File.open file_name do |file_handle|
      content = file_handle.read
      doc = Nokogiri::HTML(content)
      struct = {}
      doc.css('html > body > arrayofdetailitem > detailitem > detailinfo').each do |detail_info|

        group_id = detail_info.css("groupid").text
        if group_ids.include? group_id

          make_synonym_group_id = detail_info.css("makesynonymgroupid").text
          replacements[make_synonym_group_id] ||= {:details => [], :found_searched => false}

          struct[:detail_num] = detail_info.css('detailnum').text
          struct[:make_name] = detail_info.css('makename').text
          #struct[:detail_name_rus] = detail_info.css('detailnamerus').text

          unless replacements[make_synonym_group_id][:details].any? do |replacement|
              replacement[:detail_num] == struct[:detail_num] &&
              replacement[:make_name] == struct[:make_name]
            end
            replacements[make_synonym_group_id][:details] << struct.clone
            if file_name.include? struct[:detail_num]
              replacements[make_synonym_group_id][:found_searched] = true
              replacements[make_synonym_group_id][:searched] = {:detail_num => struct[:detail_num], :make_name => struct[:make_name]}
            end
          end

        end

      end

    end

    found_searched = nil

    # Если файл с результатами запроса на emex не пустой
    if replacements.present?
      # Откидываем reject'ом группы, где не нашелся такой номер, что имя файла содержит хотя бы один
      # из каталожных номеров, содержащихся в этой группе. И запоминаем результат в found_searched
      if (found_searched = replacements.reject do |key, value| 
          value[:found_searched] == false
          end).blank?
        puts "В файле #{file_name} искомый номер не найден"
      elsif found_searched != replacements
        puts "В файле #{file_name} искомый номер найден частично"
      end
    end

    if found_searched
      found_searched.each do |key, group|
        if group.size > 1
          group[:details].each do |detail|
            #debugger
            if group[:searched][:detail_num] != detail[:detail_num] && group[:searched][:make_name] != detail[:make_name]
              csv << [group[:searched][:detail_num], group[:searched][:make_name], detail[:detail_num], detail[:make_name]]
            end
          end 
        end
      end
    end
  
  #  if found_searched.size > 1 && found_searched.all? do |key, value|
  #        value[:details].size > 1
  #      end
  #    debugger
  #    puts '1'
  #  end
    #debugger
    #puts 1

  File.delete(file_name)

  end
end
