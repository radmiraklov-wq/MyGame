class Fixnum
  def num_digits
    tarVol = self.round
    tarVol = self.abs
    return 1 if tarVol < 1
    Math.log10(tarVol).to_i + 1
  end
    def truncate(num)
       p self
       p num
       return ((self * (10 ** num)).to_i).to_f / (10 ** num)
    end
  
end

class Array
  def sum(method = nil, &block)
    if block_given?
      raise ArgumentError, "You cannot pass a block and a method!" if method
      inject(0) { |sum, i| sum + yield(i) }
    elsif method
      inject(0) { |sum, i| sum + i.send(method) }
    else
      inject(0) { |sum, i| sum + i }
    end
  end
end

class Numeric
end

class Float
  #unused
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
  #  def truncate(num=0)
  #     return ((self * (10 ** num)).to_i).to_f/(10 ** num)
  #  end
 
end


class Integer
  # return an array containing each digit.
  def split_digits
    return [0] if zero?
    res = []
    quotient = self.abs #take care of negative integers
    until quotient.zero? do
      quotient, modulus = quotient.divmod(10)
      res.unshift(modulus) #put the new value on the first place, shifting all other values
    end
    res
  end
end

module Kernel
    $PRP_REC = [] if !$PRP_REC
    def prp (val=nil,color=0)
        #RGBCMYK
        #1234567
        $PRP_REC = $PRP_REC.last(26) if $PRP_REC.length >= 27
        $PRP_REC << [val,color]
        p val
    end
end
