CLASS zcl_oper_cad_caract_hugo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_oper_cad_caract_hugo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "1. Concatenación

    DATA mv_exercise TYPE n LENGTH 4 VALUE 6.
    DATA mv_invoice_no TYPE n LENGTH 8 VALUE 4.
    DATA mv_invoice_code TYPE string.

    CONCATENATE mv_exercise
                mv_invoice_no
           INTO mv_invoice_code
           SEPARATED BY '/'.

    out->write( mv_invoice_code ).

    "2. Concatenaciones líneas de Tablas

    " DATA: lt_employees      TYPE STANDARD TABLE OF ZEMP_LOGALI WITH EMPTY KEY,
    "lv_table_name     TYPE string VALUE `ZEMP_LOGALI`,
    " lv_employees_text TYPE string.

    "SELECT *
    " FROM (lv_table_name)
    " INTO TABLE @lt_employees.

    "lv_employees_text = concat_lines_of(
    " table = lt_employees
    " sep   = ` `
    ").

    " out->write( lv_employees_text ).


    "3. Condensación

    DATA: mv_case1 TYPE string,
          mv_case2 TYPE string.

    mv_case1 = `Sales invoice with status in process`.
    CONDENSE mv_case1.

    out->write( mv_case1 ).

    mv_case2 = `***ABAP*Cloud***`.
    CONDENSE mv_case2 NO-GAPS.
    REPLACE ALL OCCURRENCES OF `*` IN mv_case2 WITH ``.
    out->write( mv_case2 ).


    "4. SPLIT

    DATA: mv_data        TYPE string VALUE `0001111111;LOGALI GROUP;2024`,
          mv_id_customer TYPE string,
          mv_customer    TYPE string,
          mv_year        TYPE string.

    SPLIT mv_data AT `;`
      INTO mv_id_customer
           mv_customer
           mv_year.

    out->write( |ID: { mv_id_customer }| ).
    out->write( |Cliente: { mv_customer }| ).
    out->write( |Año: { mv_year }| ).


    "5. SHIFT

    DATA mv_invoice_num TYPE string VALUE `2015ABCD`.

    SHIFT mv_invoice_num BY 2 PLACES LEFT.
    SHIFT mv_invoice_num BY 2 PLACES RIGHT.

    out->write( mv_invoice_num ).


    "6. STRLEN y NUMOFCHAR
    DATA: mv_response TYPE string VALUE ` Generating Invoice `,
          mv_count    TYPE i.

    mv_count = strlen( mv_response ).
    out->write( |STRLEN: { mv_count }| ).

    mv_count = numofchar( mv_response ).
    out->write( |NUMOFCHAR: { mv_count }| ).


    "7. TRANSLATE a mayúsculas y minúsculas
    DATA mv_translate_invoice TYPE string
         VALUE `Report the issuance of this invoice`.

     TRANSLATE mv_translate_invoice TO UPPER CASE.
     out->write( mv_translate_invoice ).

    TRANSLATE mv_translate_invoice TO LOWER CASE.
     out->write( mv_translate_invoice ).


    "8. INSERT y REVERSE
    mv_translate_invoice = insert(
      val = mv_translate_invoice
      sub = ` to client`
      off = strlen( mv_translate_invoice )
    ).

    out->write( mv_translate_invoice ).

    mv_translate_invoice = reverse( mv_translate_invoice ).
    out->write( mv_translate_invoice ).


  ENDMETHOD.
ENDCLASS.
