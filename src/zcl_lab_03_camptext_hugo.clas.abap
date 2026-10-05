CLASS zcl_lab_03_camptext_hugo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_camptext_hugo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'Text with text symbols' ).
    out->write( TEXT-001 ).




    DATA(lv_order_status) = 'Purchase Completed Successfully'.
    DATA lv_char_number TYPE i.

    " Longitud con STRLEN
    lv_char_number = strlen( lv_order_status ).
    out->write( |STRLEN: { lv_char_number }| ).

    "Longitud numofchar
    lv_char_number = numofchar( lv_order_status ).
    out->write( |NUMOFCHAR: { lv_char_number }| ).

    "Contar las A/a sin distinguir mayúsculas y minúsculas
    lv_char_number = count( val = to_upper( lv_order_status ) sub = 'A' ).
    out->write( |Cantidad de A/a: { lv_char_number }| ).

    " Buscar "Exit"
    lv_char_number = find( val = lv_order_status sub = 'Exit' ).
    out->write( |Posición de Exit: { lv_char_number }| ).



    "Funciones de procesamiento

    lv_order_status = to_upper( lv_order_status ).
    out->write( lv_order_status ).

    lv_order_status = to_lower( lv_order_status ).
    out->write( lv_order_status ).

    lv_order_status = to_mixed( val = lv_order_status ).
    out->write( lv_order_status ).


    "Funciones de contenido

    " DATA(lv_pattern) = `\d{3}-\d{3}-\d{4}`.
    DATA(lv_phone)   = `123-456-7890`.

    "  IF contains( val = lv_phone
    "           pcre = lv_pattern ).

    "  out->write( 'El teléfono tiene el formato correcto.' ).

    " ELSE.

    out->write( 'El teléfono NO tiene el formato correcto.' ).

    "ENDIF.


    "Funciones con expresiones regulares

    DATA lv_email TYPE string VALUE 'hugodominguezlloren@gmail.com'.
    DATA(lv_pattern) = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

    IF contains( val = lv_email
                  pcre = lv_pattern              ).

      out->write( 'El correo es correcto' ).



    ELSE.
      out->write( 'Error' ).

    ENDIF.
















  ENDMETHOD.

ENDCLASS.
