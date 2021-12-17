*&---------------------------------------------------------------------*
*& Report ZTABLE_EXPRESSIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTABLE_EXPRESSIONS.

START-OF-SELECTION.

SELECT *
  FROM spfli
    INTO TABLE @DATA(table).

DATA(filter) = table[ carrid = 'AA' connid = '0017' ].

cl_demo_output=>display( filter ).
