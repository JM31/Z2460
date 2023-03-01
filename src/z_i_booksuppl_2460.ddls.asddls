@AbapCatalog.sqlViewName: 'ZV_BOOKSUPL_2460'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Booking Supplement'
define view z_i_booksuppl_2460
  as select from ztb_bksuppl_2460 as BookingSupplement
  association        to parent z_i_booking_2460 as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                   and $projection.BookingId = _Booking.BookingId
  association [1..1] to Z_I_TRAVEL_2460         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /dmo/supplement         as _Product         on  $projection.SupplementId = _Product.supplement_id
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID

{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
  key booking_supplement_id,
      supplement_id   as SupplementId,
      @Semantics.amount.currencyCode: 'currency'
      price,
      @Semantics.currencyCode: true
      currency,
      last_changed_at as LastChangedAt,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
