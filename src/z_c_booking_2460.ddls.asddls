@EndUserText.label: 'Consumption - Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity z_c_booking_2460
  as projection on z_i_booking_2460
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      _Carrier.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
       _Travel: redirected to parent Z_C_TRAVEL_2460,
      _BookingSupplement: redirected to composition child z_c_booksuppl_2460,
      _Carrier,
      _Connection,
      _Customer
    
}
