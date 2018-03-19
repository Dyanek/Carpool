$('.join-trip').click(function (id) {
    var tripId = id.currentTarget.attributes[1].value;
    $.ajax({
        url: 'Trip/JoinTrip',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ pTripId: tripId }),
        success: function (data) {
            $('#' + tripId).removeAttr('id').removeClass('join-trip').empty().append(data);
        },
        error: function (response) {
            console.log('Error while trying to join' + response);
        }
    });
});