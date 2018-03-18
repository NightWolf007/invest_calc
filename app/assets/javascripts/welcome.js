$(document).ready(function() {
    form = $('#revenueForm')
    form.submit(function(event) {
        event.preventDefault()

        amount = $('#amount').val()
        term = $('#term').val()
        rate = $('#rate').val()

        CalculateLoanRevenue(amount, term, rate)
    })
})

function CalculateLoanRevenue(amount, term, rate) {
    $.ajax({
        url: '/api/loans/revenue',
        async: true,
        type: 'GET',
        data: {
            amount: Math.floor(parseFloat(amount) * 100),
            term: term,
            rate: rate
        },
        dataType: 'json',
        success: function(data) {
            expectedRate = Math.round(data.expected.rate * 100) / 100
            expectedRevenue = (data.expected.revenue / 100).toFixed(2)
            actualRate = Math.round(data.actual.rate * 100) / 100
            actualRevenue = (data.actual.revenue / 100).toFixed(2)

            $('#expectedRate').text(expectedRate)
            $('#expectedRevenue').text(expectedRevenue)
            $('#actualRate').text(actualRate)
            $('#actualRevenue').text(actualRevenue)
        }
    })
}
