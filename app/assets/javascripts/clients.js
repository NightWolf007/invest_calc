$(document).ready(function () {
    $('#new_client').submit(function () {
        $(this).find('input[id$=_amount]').each(function() {
            value = Math.floor(parseFloat($(this).val()) * 100)
            $(this).val(value)
        })
    })

    $('#addLoan').click(function (event) {
        event.preventDefault()
        addLoan()
    })

    $('.addPayment').click(function (event) {
        event.preventDefault()
        addPayment($(event.target).parent().children('.payments'))
    })
})

function addLoan() {
    idx = $('#loans').children().length
    newForm = $('#loanForm').clone()
    newForm.find('label').each(function() {
        attr_for = $(this).attr('for').replace(/0/, idx)
        $(this).attr('for', attr_for)
    })
    newForm.find('input').each(function() {
        attr_id = $(this).attr('id').replace(/0/, idx)
        attr_name = $(this).attr('name').replace(/0/, idx)
        $(this).attr('id', attr_id)
        $(this).attr('name', attr_name)
    })
    newForm.appendTo('#loans')

    newForm.find('.addPayment').click(function (event) {
        event.preventDefault()
        addPayment($(event.target).parent().children('.payments'))
    })
}

function addPayment(payments) {
    idx = payments.children().length
    newForm = payments.children('.paymentForm').first().clone()
    newForm.find('label').each(function() {
        attr_for = $(this).attr('for').replace(/0([^0]*)$/, idx + '$1')
        $(this).attr('for', attr_for)
    })
    newForm.find('input').each(function() {
        attr_id = $(this).attr('id').replace(/0([^0]*)$/, idx + '$1')
        attr_name = $(this).attr('name').replace(/0([^0]*)$/, idx + '$1')
        $(this).attr('id', attr_id)
        $(this).attr('name', attr_name)
    })
    newForm.appendTo(payments)
}
