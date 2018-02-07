class Luhn
  def self.checksum(value)
    value = value.to_s unless value.class == String
    i = 0
    value.split('').map { |c| c.to_i }.reverse.inject { |sum, a| sum + ((i+=1)%2>0 ? (a<5 ? 2*a : 2*a-9) : a) } % 10
  end

  def self.checksum_valid?(str)
    checksum(str) == 0
  end

  def self.generate(type = :visa)
    prefix = {:visa => '402024', :mastercard => '513028', :amex => '343422', :solo => '633422', :switch => '493622', :visaelectron => '402170', :visadelta => '453922', :maestro => '501822', :jcb => '352822', :visadebit =>'465874', :entropay =>'444422', :laser =>'630422'}
    length = {:visa => 16, :mastercard => 16, :amex => 16, :solo => 16, :switch => 16, :visaelectron => 16, :visadelta => 16, :maestro => 16, :jcb => 16, :visadebit => 16, :entropay => 16, :laser => 16}
    num = sprintf("%s%.8d", prefix[type], (rand * 10**8).to_i)
    rem = length[type] - prefix[type].length - 8 - 1
    fmt = "%.#{rem}d"
    num += sprintf(fmt, (rand * 10**rem).to_i)
    chk = checksum(num+'0')
    num + ((10 - chk) % 10).to_s
  end
end

cards =['visa', 'mastercard', 'amex', 'solo', 'switch', 'visaelectron', 'visadelta', 'maestro', 'jcb', 'visadebit', 'entropay', 'laser']
card_entered = ARGV[0].downcase
if cards.include? card_entered

  puts "\n"+ Luhn.generate(type = :"#{card_entered}")+"\n\n"
  else
  puts "\nThe card type you have entered was not recognised. Please select from the following cards:"
  cards.each do |card_type| puts card_type end
end


