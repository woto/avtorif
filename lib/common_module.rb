module CommonModule
  class << self
    
    CATALOG_NUMBER_LEN = AppConfig.catalog_number_len

    def all_doublets
      alpha_numerics = ('0'..'9').to_a + ('a'..'f').to_a
      alpha_numerics.product(alpha_numerics).map{ |doublet| doublet.join ''}.shuffle.each do |l| 
        yield l
      end 
    end

    def normalize_catalog_number catalog_number
      catalog_number.to_s.mb_chars.upcase.strip.gsub(/[^a-z0-9]/i, '').to_s[0, CATALOG_NUMBER_LEN]
    end
  end
end
