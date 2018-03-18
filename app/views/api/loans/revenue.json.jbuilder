json.expected do
  json.rate @calc.expected_rate * 100
  json.revenue @calc.expected_revenue
end

json.actual do
  json.rate @calc.actual_rate * 100
  json.revenue @calc.actual_revenue
end
