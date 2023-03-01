CLASS zcl_insert_data_log_2460 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_LOG_2460 IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    DATA: lt_travel TYPE TABLE OF ZTB_TRAVEL_2460,
          lt_booking TYPE TABLE OF ZTB_BOOKING_2460,
          lt_book_sup TYPE TABLE OF ZTB_BKSUPPL_2460.

    SELECT travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    booking_fee,
    total_price,
    currency_code,
    description,
    status AS overall_status,
    createdby AS created_by,
    createdat AS created_at,
    lastchangedby AS last_changed_by,
    lastchangedat AS last_changed_at
    FROM /dmo/travel INTO CORRESPONDING FIELDS OF
    TABLE @lt_travel
    UP TO 50 ROWS.

    SELECT * FROM /dmo/booking
    FOR ALL ENTRIES IN @lt_travel
    WHERE travel_id EQ @lt_travel-travel_id
    INTO CORRESPONDING FIELDS OF TABLE
    @lt_booking.
    SELECT * FROM /dmo/book_suppl
    FOR ALL ENTRIES IN @lt_booking
    WHERE travel_id EQ @lt_booking-travel_id
    AND booking_id EQ @lt_booking-booking_id
    INTO CORRESPONDING FIELDS OF TABLE
    @lt_book_sup.

    DELETE FROM: ZTB_TRAVEL_2460,
                 ZTB_BOOKING_2460,
                 ZTB_BKSUPPL_2460.

INSERT: ZTB_TRAVEL_2460 FROM TABLE @lt_travel,
        ZTB_BKSUPPL_2460 FROM TABLE @lt_book_sup,
        ZTB_BOOKING_2460 FROM TABLE @lt_booking.




out->write( 'DONE!' ).
ENDMETHOD.
ENDCLASS.
