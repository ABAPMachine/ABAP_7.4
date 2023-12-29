CLASS zcl_types_practice DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_types_practice IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_flights TYPE /DMO/T_FLIGHT.

    APPEND VALUE #( carrier_id = 'AA' connection_id  = '001' flight_date = '20231228' ) TO lt_flights.

    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<ls_flights>).
        out->write( |{ <ls_flights>-carrier_id } | && |{ <ls_flights>-connection_id } | && |{ <ls_flights>-carrier_id }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
