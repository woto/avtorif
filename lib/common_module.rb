module CommonModule
  class << self
    def all_doublets
      alpha_numerics = ('0'..'9').to_a + ('a'..'f').to_a
      alpha_numerics.product(alpha_numerics).map{ |doublet| doublet.join ''}.shuffle.each do |l| 
        yield l
      end 
    end

    def normalize_catalog_number catalog_number
      catalog_number.to_s.mb_chars.upcase.strip.gsub(/[ ,-.]/, '').to_s
    end
  end
end
