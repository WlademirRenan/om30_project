module Cns
    class Validator
      SIZE = 15
  
      attr_accessor :cns
  
      def initialize(cns)
        raise ArgumentError, 'CNS must be a string' unless cns.is_a?(String)
  
        @cns = cns.gsub(/\s+/, '')
      end
  
      def self.valid?(cns)
        new(cns.gsub(/\s+/, '')).valid?
      end
  
      def valid?
        return false unless valid_size?
        return false unless only_numbers?
  
        case cns.chars.first
        when '1', '2'
          validate_cns
        when '8', '9'
          valida_temporary_cns
        else
          false
        end
      end
  
      private
  
      def valid_size?
        cns.length == SIZE
      end
  
      def only_numbers?
        cns.match?(/\A\d+\Z/)
      end
  
      def validate_cns
        pis = cns[0...11]
        sum =
          pis.chars.each_with_index.inject(0) do |result, (char, i)|
            result += char.to_i * (SIZE - i)
            result
          end
        compare_digits(sum, pis)
      end
  
      def compare_digits(sum, pis)
        dv = 11 - (sum % 11)
        dv = 0 if dv == 11
        cns_generated =
          if dv == 10
            sum += 2
            dv = 11 - (sum % 11)
            "#{pis}001#{dv}"
          else
            "#{pis}000#{dv}"
          end
        cns == cns_generated
      end
  
      def valida_temporary_cns
        sum =
          cns.chars.each_with_index.inject(0) do |result, (char, i)|
            result += char.to_i * (SIZE - i)
            result
          end
        (sum % 11).zero?
      end
    end
  end