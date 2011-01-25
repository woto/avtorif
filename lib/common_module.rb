module CommonModule
  def self.all_prices_costs
    alpha_numerics = ('0'..'9').to_a + ('a'..'f').to_a
    alpha_numerics.product(alpha_numerics).map{ |doublet| doublet.join ''}.shuffle.each do |l| 
      yield l
    end 
  end
end
