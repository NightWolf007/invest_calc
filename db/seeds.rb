# frozen_string_literal: true

Client.create(
  name: 'ЮЛ1',
  loans: [
    Loan.new(
      amount: 1_000_000_00,
      term: 6,
      rate: 30,
      payment_period: 1,
      overdue_rate: 50,
      opening_date: Date.new(2014, 1, 1),
      payments: [
        Payment.new(
          date: Date.new(2014, 2, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2014, 3, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2014, 4, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2014, 5, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2014, 6, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2014, 7, 1),
          amount: 191_666_67
        )
      ]
    )
  ]
)

Client.create(
  name: 'ЮЛ2',
  loans: [
    Loan.new(
      amount: 1_000_000_00,
      term: 6,
      rate: 30,
      payment_period: 1,
      overdue_rate: 50,
      opening_date: Date.new(2015, 1, 1),
      payments: [
        Payment.new(
          date: Date.new(2015, 2, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2015, 3, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2015, 4, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2015, 5, 1),
          amount: 525_000_00
        )
      ]
    )
  ]
)

Client.create(
  name: 'ЮЛ3',
  loans: [
    Loan.new(
      amount: 1_000_000_00,
      term: 6,
      rate: 30,
      payment_period: 1,
      overdue_rate: 50,
      opening_date: Date.new(2016, 1, 1),
      payments: [
        Payment.new(
          date: Date.new(2016, 2, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2016, 3, 1),
          amount: 191_666_67
        ),
        Payment.new(
          date: Date.new(2016, 4, 10),
          amount: 208_333_33
        ),
        Payment.new(
          date: Date.new(2016, 5, 10),
          amount: 208_333_33
        ),
        Payment.new(
          date: Date.new(2016, 6, 10),
          amount: 208_333_33
        ),
        Payment.new(
          date: Date.new(2016, 7, 10),
          amount: 208_333_33
        )
      ]
    )
  ]
)
