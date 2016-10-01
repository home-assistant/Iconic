
# enumerable_stats.rb
# https://github.com/artsy/eigen/blob/master/config/enumerable_stats.rb
# based on http://stackoverflow.com/questions/5892408/inferential-statistics-in-ruby/5892661#5892661

module Enumerable
    
    def sum
        inject(0){ |accum, i| accum + i }
    end
    
    def mean
        sum/length.to_f
    end
    
    def sample_variance
        m = mean
        sum = inject(0){ |accum, i| accum +(i-m) ** 2 }
        (1 / length.to_f * sum)
    end
    
    def standard_deviation
        Math.sqrt(sample_variance)
    end
    
    def outliers(deviation)
        m = mean
        sd = standard_deviation
        select { |n| (m-n).abs > (deviation * sd) }
    end
end
