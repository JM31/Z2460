@EndUserText.label: 'Comsumption - Booking Supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity z_c_booksuppl_2460
  as projection on z_i_booksuppl_2460
{
  key TravelId,
  key BookingId,
  key booking_supplement_id       as BookingSupplementID,
      SupplementId,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      @Semantics.currencyCode: true
      currency                    as CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel  : redirected to Z_C_TRAVEL_2460,
      _Booking : redirected to parent z_c_booking_2460,
      _Product


}
