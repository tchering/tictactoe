require "csv"
require "json"
@transactions = [10, -15, 25, 30, -24, -70, 999]

def to_json(data)
  File.open("transaction.json", "w") do |file|
    file.write(JSON.dump(data))
  end
end

def to_csv(data)
  CSV.open("transaction.csv", "wb") do |csv|
    csv << ["Amount"]
    data.each do |transaction|
      csv << [transaction]
    end
  end
end

def transaction_statement
  array = []
  @transactions.each do |transaction|
    array << yield(transaction) # You just yield the transaction amount.
  end
  array
  to_json(array)
  to_csv(array)
end

transaction_statement do |transaction|
  "$%0.2f" % transaction # The bank that calls the method can define how it is handled.
end

# transaction_statement {|transaction| p "%0.2f" % transaction}
