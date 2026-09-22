CLASS zcl_lab_02_calcu_hugo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_calcu_hugo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


    "Suma +

    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.


    lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.

    out->write( |Number a:{ lv_base_rate } + Number b:{ lv_corp_area_rate } + Number c:{ lv_medical_service_rate } = Total: { lv_total_rate }| ).


"Forced type conversions

DATA(lv_date_inv) = '20260922'.
out->write( lv_date_inv ).

DATA(lv_date_inv2) = CONV d( lv_date_inv ).
out->write( lv_date_inv2 ).












     ENDMETHOD.

ENDCLASS.
