class HashMap
  def initialize
    @buckets = Array.new(16) { [] }  # 16 वटा खाली array को buckets तयार पारिन्छ (प्रारम्भिक क्षमता 16)
    @size = 0  # `HashMap` मा भएका हालका key-value pair को संख्या
  end

  def hash(key)
    # Key लाई string मा रूपान्तरण गरी प्रत्येक character को ASCII मान (ord) को योगफल निकाल्छ
    # त्यसलाई buckets को आकारबाट भाग गरी बाँकी (modulo) लिन्छ
    key.to_s.each_char.reduce(0) { |sum, char| sum + char.ord } % @buckets.size
  end

  def set(key, value)
    resize if load_factor > 0.75  # Load factor 0.75 भन्दा बढी भएमा buckets को आकार बढाइन्छ (resize गरिन्छ)
    index = hash(key)  # Key को hash function प्रयोग गरी यसको index निकालिन्छ
    bucket = @buckets[index]  # सो index को bucket पत्ता लगाइन्छ (bucket एउटा array हो)
    pair = bucket.find { |k, _| k == key }  # सो bucket भित्र key पहिल्यै छ कि छैन, त्यो पत्ता लगाइन्छ
    if pair
      pair[1] = value  # यदि key पहिल्यै छ भने, त्यसको value अपडेट गरिन्छ | and we have pair[1] because in nested array there is
    else
      bucket << [key, value]  # यदि key छैन भने, नयाँ key-value pair bucket मा थपिन्छ
      @size += 1  # `HashMap` को आकार एकले बढाइन्छ
    end
  end

  def get(key)
    index = hash(key)  # Key को hash function प्रयोग गरी index निकालिन्छ
    bucket = @buckets[index]  # सो index को bucket पत्ता लगाइन्छ
    pair = bucket.find { |k, _| k == key }  # सो bucket भित्र key खोजिन्छ
    pair ? pair[1] : "no data found"  # यदि key भेटियो भने value return गरिन्छ, नभए no data found return गरिन्छ
  end

  def delete(key)
    index = hash(key)  # Key को hash function प्रयोग गरी index निकालिन्छ
    bucket = @buckets[index]  # सो index को bucket पत्ता लगाइन्छ
    pair = bucket.find { |k, _| k == key }
    bucket.delete(pair) if pair # bucket भित्र त्यो key भएको pair हटाइन्छ
    @size -= 1 # यदि key हटाइयो भने `HashMap` को आकार एकले घटाइन्छ
  end

  private

  def load_factor
    @size.to_f / @buckets.size  # Load factor निकालिन्छ (कुल key-value pair संख्या / कुल buckets संख्या)
  end

  def resize
    old_buckets = @buckets  # पुरानो buckets को reference राखिन्छ
    @buckets = Array.new(@buckets.size * 2) { [] }  # नयाँ buckets को array तयार गरिन्छ, जसको आकार दोब्बर हुन्छ
    @size = 0  # `HashMap` को आकारलाई फेरि गणना गर्न 0 मा सेट गरिन्छ

    old_buckets.flatten(1).each do |key, value|
      set(key, value)  # पुरानो buckets का सबै key-value pairs लाई नयाँ buckets मा पुनः सेट गरिन्छ
    end
  end
end

# Example usage
hash_map = HashMap.new
hash_map.set("Sonam", "Developer")  # "Sonam" लाई "Developer" को रूपमा सेट गरिन्छ
hash_map.set("Sherpa", "Engineer")  # "Sherpa" लाई "Engineer" को रूपमा सेट गरिन्छ
puts hash_map.get("Sonam")  # "Sonam" को value, जुन "Developer" हो, print गरिन्छ
puts hash_map.get("Sherpa") # "Sherpa" को value, जुन "Engineer" हो, print गरिन्छ
hash_map.delete("Sonam")  # "Sonam" को entry delete गरिन्छ
puts hash_map.get("Sonam")  # "Sonam" को value अब nil हुन्छ किनकि यो delete गरिसकिएको छ
