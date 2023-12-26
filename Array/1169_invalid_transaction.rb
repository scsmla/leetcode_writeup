# @param {String[]} transactions
# @return {String[]}
# Link: https://leetcode.com/problems/invalid-transactions/
def invalid_transactions(transactions)
  n = transactions.length
  res = []

  for i in 0..n-1
    name, time, amount, city = transactions[i].split(',')
    if amount.to_i > 1000
      res << transactions[i]
    else
      invalid = false
      for j in 0..n-1
        next if j == i
        namej, timej, amountj, cityj = transactions[j].split(',')
        if namej == name && (timej.to_i - time.to_i).abs <= 60 && cityj != city
          invalid = true
          break
        end
      end

      res << transactions[i] if invalid
    end
  end

  res
end
