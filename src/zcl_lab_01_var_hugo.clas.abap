CLASS zcl_lab_01_var_hugo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_var_hugo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

"Date and time

    DATA: mv_purchase_date TYPE d VALUE '20260921',
          mv_purchase_time TYPE t VALUE '170455'.

    out->write( |Fecha: { mv_purchase_date+6(2) }/{ mv_purchase_date+4(2) }/{ mv_purchase_date(4) }| ).

    out->write( |Hora: { mv_purchase_time(2) }:{ mv_purchase_time+2(2) }:{ mv_purchase_time+4(2) }| ).

"Price and tax

    DATA: mv_price TYPE f VALUE '10.5',
          mv_tax   TYPE i VALUE '16'.

    out->write( |Price: { mv_price }| ).

    out->write( |Tax: { mv_tax }| ).

"Increase and discount


    DATA: mv_increase TYPE decfloat16 VALUE '20.5',
          mv_discount TYPE decfloat34 VALUE '10.5'.

    out->write( |Increase: { mv_increase }| ).
    out->write( |Discount: { mv_discount }| ).


"Type and shipping


    DATA: mv_type     TYPE c LENGTH 10 VALUE '10',
          mv_shipping TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36'.

    out->write( |Type: { mv_type }| ).
    out->write( |Shipping: { mv_shipping }| ).


"Id and qr


    DATA: mv_id_code TYPE n LENGTH 4 VALUE '1110',
          mv_qr_code TYPE x LENGTH 5 VALUE 'F5CF'.

    out->write( |id: { mv_id_code }| ).
    out->write( |qr: { mv_qr_code }| ).



"Datos complejos



    TYPES: BEGIN OF mty_costumer,
             id       TYPE i,
             costumer TYPE string,
             age      TYPE i,
           END OF mty_costumer.

    DATA mv_costumer TYPE mty_costumer.

    mv_costumer = VALUE #(
      id       = 12345
      costumer = '23456'
      age      = 23
    ).

    out->write( mv_costumer ).


"Declaracion en linea


    DATA(lv_product) = 'Producto'.
    DATA(lv_bar_code) = '123456789'.

    lv_product = 'Producto'.
    lv_bar_code = '123456789'.







  ENDMETHOD.






ENDCLASS.
