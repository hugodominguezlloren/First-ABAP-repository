CLASS zcl_lab_uso_conv_hugo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_uso_conv_hugo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "-----------------------------------------------------------
    " 1. Conversiones de tipo
    "-----------------------------------------------------------
    DATA mv_char  TYPE c LENGTH 10 VALUE '12345'.
    DATA mv_num   TYPE i.
    DATA mv_float TYPE f.

    mv_num   = mv_char.   " C -> I
    mv_float = mv_num.    " I -> F

    out->write( |1. MV_CHAR  = { mv_char }| ).
    out->write( |1. MV_NUM   = { mv_num }| ).
    out->write( |1. MV_FLOAT = { mv_float }| ).

    "-----------------------------------------------------------
    " 2. Truncamiento y redondeo
    "-----------------------------------------------------------
    DATA mv_trunc TYPE i.
    DATA mv_round TYPE i.

    mv_float = '123.45'.
    mv_trunc = trunc( mv_float ).        " 123
    mv_round = mv_float + '0.5'.         " 123.95 -> redondea a 124

    out->write( |2. MV_TRUNC = { mv_trunc }| ).
    out->write( |2. MV_ROUND = { mv_round }| ).

    "-----------------------------------------------------------
    " 3. Declaración en línea
    "-----------------------------------------------------------
    DATA(lv_inline) = 'ABAP'.
    out->write( |3. Variable en línea = { lv_inline }| ).

    "-----------------------------------------------------------
    " 4. Conversión forzada (CONV)
    "-----------------------------------------------------------
    mv_num = CONV i( mv_char ).
    out->write( |4. MV_NUM (conversión forzada) = { mv_num }| ).

    "-----------------------------------------------------------
    " 5. Cálculo de fecha y hora
    "-----------------------------------------------------------
    DATA mv_date_1 TYPE d.
    DATA mv_date_2 TYPE d.
    DATA mv_days   TYPE i.
    DATA mv_time   TYPE t.

    mv_date_1 = '20240101'.
    mv_date_2 = '20240315'.

    mv_days = mv_date_2 - mv_date_1.

    out->write( |5. Días entre fechas = { mv_days }| ).
    out->write( |5. MV_DATE_1 (DDMMAAAA) = { mv_date_1+6(2) }{ mv_date_1+4(2) }{ mv_date_1(4) }| ).

    "-----------------------------------------------------------
    " 6. Campos timestamp
    "-----------------------------------------------------------
    DATA mv_timestamp TYPE utclong.

    mv_timestamp = utclong_current( ).
    out->write( |6. Timestamp actual = { mv_timestamp }| ).

    " Pasar fecha y hora del timestamp a MV_DATE_2 y MV_TIME
    CONVERT UTCLONG mv_timestamp
            TIME ZONE 'UTC'
            INTO DATE mv_date_2
                 TIME mv_time.

    out->write( |6. MV_DATE_2 = { mv_date_2 DATE = ISO }| ).
    out->write( |6. MV_TIME   = { mv_time TIME = ISO }| ).

    " Restar 2 días al timestamp
    mv_timestamp = utclong_add( val  = mv_timestamp
                                days = -2 ).
    out->write( |6. Timestamp - 2 días = { mv_timestamp }| ).


  ENDMETHOD.
ENDCLASS.
