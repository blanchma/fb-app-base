class Float
    alias oldround:round
    def round(precision = nil)
        if precision.nil?
            return self
        else
            return ((self * 10**precision).oldround.to_f) / (10**precision)
        end
    end
end
