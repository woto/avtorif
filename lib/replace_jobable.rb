class ReplaceJobable < AbstractJobber

  def insert(catalog_number, catalog_number_orig, new_catalog_number, new_catalog_number_orig, manufacturer, manufacturer_orig, weight_grams, replacement, replacement_orig, replacement_manufacturer, replacement_manufacturer_orig)
    query = ""
    query << "(#{@job_id}, "
    query << catalog_number + ", "
    query << catalog_number_orig + ", "
    query << new_catalog_number + ", "
    query << new_catalog_number_orig + ", "
    query << manufacturer + ", "
    query << manufacturer_orig + ", "
    query << weight_grams + ", "
    query << @supplier_id + ", "
    query << replacement + ", "
    query << replacement_orig + ", "
    query << replacement_manufacturer + ", "
    query << replacement_manufacturer_orig + ") "
  end

  def perform
    
    @job_id = @job.id
    @supplier_id = Price.connection.quote(@job.supplier_id)
    max_replaces = AppConfig.max_replaces
    catalog_number_colnum = @jobable.catalog_number_colnum - 1

    if @jobable.weight_grams_colnum.present?
      weight_grams_colnum = @jobable.weight_grams_colnum - 1
      weight_coefficient = @jobable.weight_coefficient.to_f
    end

    if @jobable.manufacturer_colnum.present?              
      manufacturer_colnum = @jobable.manufacturer_colnum - 1
    end

    if @jobable.default_manufacturer.present?
      default_manufacturer = @jobable.default_manufacturer
    end

    if @jobable.new_catalog_number_colnum.present?              
      new_catalog_number_colnum = @jobable.new_catalog_number_colnum - 1
    end

    r_colnum = []
    rm_colnum = []
    rdm = []
    rdi = []
    rde = []

    for j in 0...max_replaces do

      if eval("@jobable.r#{j}_colnum.present?")
        r_colnum[j] = eval "@jobable.r#{j}_colnum - 1"
      end

      if eval("@jobable.rm#{j}_colnum.present?")
        rm_colnum[j] = eval "@jobable.rm#{j}_colnum - 1"
      end

      if eval("@jobable.rdm#{j}.present?")
        rdm[j] = eval "@jobable.rdm#{j}"
      end

      if eval("@jobable.rdi#{j}.present?")
        rdi[j] = eval "@jobable.rdi#{j}"
      end

      if eval("@jobable.rde#{j}.present?")
        rde[j] = eval "@jobable.rde#{j}"
      end
      
    end

    CommonModule::prepare_insertion_table(@job_id)

    query_template = "INSERT INTO price_import_#{@job_id} (job_id, catalog_number, catalog_number_orig, new_catalog_number, new_catalog_number_orig, manufacturer, manufacturer_orig, weight_grams, supplier_id, replacement, replacement_orig, replacement_manufacturer, replacement_manufacturer_orig) VALUES "

    @optional.each do |opt|
      FasterCSV.foreach(SupplierPrice.find(opt).attachment.path) do |row|
        if r_colnum.size > 0
          for j in 0...max_replaces do

            r = nil
            rm = nil

            if r_colnum[j].present?

              if rde[j].to_s.size > 0
                r = row[r_colnum[j]].to_s.split(rde[j].to_s)
              else
                r = [row[r_colnum[j]].to_s]
              end

              if rm_colnum[j].present?
                # Если указан колонка производитель замены
                rm = CommonModule::find_manufacturer_synonym(row[rm_colnum[j]], @job_id)
                rm_orig = CommonModule::manufacturer_orig(row[rm_colnum[j]])
              elsif rdm[j].present?
                # Иначе если у колонки производитель по-умолчанию
                rm = CommonModule::find_manufacturer_synonym(rdm[j], @job_id)
                rm_orig = CommonModule::manufacturer_orig(rdm[j])
              else
                rm = 'NULL'
                rm_orig = 'NULL'
              end

              for k in r do
                begin
                  if(rdi[j] == 1 || rdi[j] == 3)
                    query = query_template.dup

                    catalog_number = Price.connection.quote(CommonModule::normalize_catalog_number(row[catalog_number_colnum]))
                    catalog_number_orig = Price.connection.quote(CommonModule::catalog_number_orig(row[catalog_number_colnum]))

                    if manufacturer_colnum.present?
                      manufacturer_orig = CommonModule::manufacturer_orig(row[manufacturer_colnum])
                    elsif default_manufacturer.present? 
                      manufacturer_orig = CommonModule::manufacturer_orig(default_manufacturer)
                    else
                      manufacturer_orig = "NULL"
                    end

                    if manufacturer_colnum.present?
                      manufacturer = CommonModule::find_manufacturer_synonym(row[manufacturer_colnum], @job_id)
                    elsif default_manufacturer.present?
                      manufacturer = CommonModule::find_manufacturer_synonym(default_manufacturer, @job_id)
                    else
                      manufacturer = "NULL"
                    end

                    new_catalog_number = new_catalog_number_colnum.present? ? Price.connection.quote(CommonModule::normalize_catalog_number(row[new_catalog_number_colnum])) : "NULL"
                    new_catalog_number_orig = new_catalog_number_colnum.present? ? Price.connection.quote(CommonModule::catalog_number_orig(row[new_catalog_number_colnum])) : "NULL"
                    weight_grams = weight_grams_colnum.present? ? Price.connection.quote(row[weight_grams_colnum].to_s.gsub(',','.').gsub(' ', '').to_f * weight_grams_coefficient) : "NULL"
                    replacement = Price.connection.quote(CommonModule::normalize_catalog_number(k))
                    replacement_orig = Price.connection.quote(CommonModule::catalog_number_orig(k))
                    replacement_manufacturer = rm
                    replacement_manufacturer_orig = rm_orig
                    query << insert(catalog_number, catalog_number_orig, new_catalog_number, new_catalog_number_orig, manufacturer, manufacturer_orig, weight_grams, replacement, replacement_orig, replacement_manufacturer, replacement_manufacturer_orig)

                    ActiveRecord::Base.connection.execute(query)
                  end

                  if(rdi[j] == 2 || rdi[j] == 3)
                    query = query_template.dup

                    catalog_number = Price.connection.quote(CommonModule::normalize_catalog_number(k))
                    catalog_number_orig = Price.connection.quote(CommonModule::catalog_number_orig(k))
                    new_catalog_number = new_catalog_number_colnum.present? ? Price.connection.quote(CommonModule::normalize_catalog_number(row[new_catalog_number_colnum])) : "NULL"
                    new_catalog_number_orig = new_catalog_number_colnum.present? ? Price.connection.quote(CommonModule::catalog_number_orig(row[new_catalog_number_colnum])) : "NULL"
                    manufacturer = rm
                    manufacturer_orig = rm_orig
                    weight_grams = weight_grams_colnum.present? ? Price.connection.quote(row[weight_grams_colnum].to_s.gsub(',','.').gsub(' ', '').to_f * weight_grams_coefficient) : "NULL"
                    replacement = Price.connection.quote(CommonModule::normalize_catalog_number(row[catalog_number_colnum]))
                    replacement_orig = Price.connection.quote(CommonModule::catalog_number_orig(row[catalog_number_colnum]))

                    if manufacturer_colnum.present?
                      replacement_manufacturer = CommonModule::find_manufacturer_synonym(row[manufacturer_colnum], @job_id)
                    elsif default_manufacturer.present?
                      replacement_manufacturer = CommonModule::find_manufacturer_synonym(default_manufacturer, @job_id)
                    else
                      replacement_manufacturer = "NULL"
                    end

                    if manufacturer_colnum.present? 
                      replacement_manufacturer_orig = CommonModule::manufacturer_orig(row[manufacturer_colnum])
                    elsif default_manufacturer.present?
                      replacement_manufacturer_orig = CommonModule::manufacturer_orig(default_manufacturer)
                    else
                      replacement_manufacturer_orig = "NULL"
                    end
    
                    query << insert(catalog_number, catalog_number_orig, new_catalog_number, new_catalog_number_orig, manufacturer, manufacturer_orig, weight_grams, replacement, replacement_orig, replacement_manufacturer, replacement_manufacturer_orig)
                    ActiveRecord::Base.connection.execute(query)
                  end
                rescue CatalogNumberException
                  next
                end
              end
            end
          end
        else
          begin
            query = query_template.dup

            catalog_number = Price.connection.quote(CommonModule::normalize_catalog_number(row[catalog_number_colnum]))
            catalog_number_orig = Price.connection.quote(CommonModule::catalog_number_orig(row[catalog_number_colnum]))
            new_catalog_number = new_catalog_number_colnum.present? ? Price.connection.quote(CommonModule::normalize_catalog_number(row[new_catalog_number_colnum])) : "NULL"
            new_catalog_number_orig = new_catalog_number_colnum.present? ? Price.connection.quote(CommonModule::catalog_number_orig(row[new_catalog_number_colnum])) : "NULL"

            if manufacturer_colnum.present?
              manufacturer_orig = CommonModule::manufacturer_orig(row[manufacturer_colnum])
            elsif default_manufacturer.present? 
              manufacturer_orig = CommonModule::manufacturer_orig(default_manufacturer)
            else
              manufacturer_orig = "NULL"
            end

            if manufacturer_colnum.present?
              manufacturer = CommonModule::find_manufacturer_synonym(row[manufacturer_colnum], @job_id)
            elsif default_manufacturer.present?
              manufacturer = CommonModule::find_manufacturer_synonym(default_manufacturer, @job_id)
            else
              manufacturer = "NULL"
            end

            weight_grams = weight_grams_colnum.present? ? Price.connection.quote(row[weight_grams_colnum].to_s.gsub(',','.').gsub(' ', '').to_f * weight_coefficient) : "NULL"
            replacement = "NULL"
            replacement_orig = "NULL"
            replacement_manufacturer = "NULL"
            replacement_manufacturer_orig = "NULL"
            query << insert(catalog_number, catalog_number_orig, new_catalog_number, new_catalog_number_orig, manufacturer, manufacturer_orig, weight_grams, replacement, replacement_orig, replacement_manufacturer, replacement_manufacturer_orig)

            ActiveRecord::Base.connection.execute(query)
          rescue CatalogNumberException
            next
          end
        end
      end
    end

    CommonModule::add_doublet(@job_id)

  end

end
