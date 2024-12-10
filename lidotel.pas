Program lidotel;

Uses crt, sysutils, classes;

Type 
  cliente = Record
    nombre: string;
    apellido: string;
    cedula: string;
    email: string;
    telefono: string;
    dias: integer;
    habitacion: string;
    preciopornoche: real;
  End;

    clienteacompaniado = Record
    cliente: cliente;
    acompaniante: cliente;
  End;

  clientegrupo = Record
    adultos: array Of cliente;
    ninios: array Of Record
      nombre: string;
      apellido: string;
      edad: integer;
    End;
  End;

const

LIMITE_HABITACIONES=133;

Var 
  opcion, subopcion, cantidadadultos, cantidadhijos, i, habitacionesOcupadas: integer;
  nuevocliente: cliente;
  nuevoacompaniante: clienteacompaniado;
  nuevogrupo: clientegrupo;

Procedure MostrarBienvenida;
Begin
  ClrScr;
  TextColor(LightBlue);
  WriteLn('|==================================================|');
  WriteLn('|===               BIENVENIDOS AL               ===|');
  WriteLn('|===      HOTEL LIDOTEL BOUTIQUE MARGARITA      ===|');
  WriteLn('|==================================================|');
  TextColor(White);
  WriteLn('Presiones Enter para comenzar...');
  While ReadKey <> #13 Do;
End;


Procedure MostrarSalida;
Begin
  ClrScr;
  TextColor(LightBlue);
  WriteLn('|==================================================|');
  WriteLn('|===                                            ===|');
  WriteLn('|===            ESTAMOS PARA SERVIRLE.          ===|');
  WriteLn('|===                                            ===|');
  WriteLn('|==================================================|');
  TextColor(White);
  Sleep(4000);
End;


Procedure MostrarMenu();
Begin
  clrscr;
  TextColor(LightGreen);
  Writeln('==== Lidotel Boutique Margarita ====');
  Writeln('|1. Nuevo cliente                  |');
  WriteLn('|==================================|');
  Writeln('|2. Buscar cliente                 |');
  WriteLn('|==================================|');
  Writeln('|3. Eliminar Reservacion           |');
  WriteLn('|==================================|');
  Writeln('|4. Salir                          |');
  WriteLn('|==================================|');
  TextColor(White);
  Writeln('Seleccione una opcion: ');
End;



Procedure MostrarTipoReservacion();
Begin
  clrscr;
  TextColor(LightGreen);
  WriteLn('=====================================');
  Writeln('|Seleccione el tipo de reservacion: |');
  WriteLn('|===================================|');
  Writeln('|1. Individual                      |');
  WriteLn('|===================================|');
  Writeln('|2. Acompaniado                     |');
  WriteLn('|===================================|');
  Writeln('|3. Grupo/Familia                   |');
  WriteLn('|===================================|');
  TextColor(White);
  Writeln('Seleccione: ');
End;



Procedure MostrarDetallesHabitaciones();
Begin
  clrscr;
  TextColor(LightGreen);
  Writeln('|========================= Detalles de las habitaciones ===========================|');
  Writeln('|1. FAMILY ROOM - 200$ por noche                                                   |' );
  Writeln('|Calida y confortable habitacion decorada con un estilo vanguardista,              |');
  Writeln('|100% libre de humo, cama Lidotel Royal King, con reloj despertador,               |');
  Writeln('|TV 32 pulgadas HD Plasma con cable, banio con ducha, cafetera electrica,          |');
  Writeln('|nevera ejecutiva, caja electrónica de seguridad y secador de cabello.             |');
  Writeln('|Incluye: Desayuno Buffet, WIFI, piscina, gimnasio, sillas y toldos en la playa.   |');
  WriteLn('|==================================================================================|');

  Writeln('|2. SENCILLA - 60$ por noche                                                       |');
  Writeln('|Amplia y confortable habitacion decorada con un estilo vanguardista,              |');
  Writeln('|cama Lidotel Royal King con sábanas de algodón egipcio, soporte para iPod,        |');
  Writeln('|TV 32 pulgadas HD Plasma con cable, banio con ducha, cafetera electrica.          |');
  Writeln('|Incluye: Desayuno Buffet, WIFI, piscina, gimnasio.                                |');
  WriteLn('|==================================================================================|');

  Writeln('|3. DOBLE - 120$ por noche                                                         |');
  Writeln('|Amplia y confortable habitacion decorada con un estilo vanguardista,              |');
  Writeln('|Dos Camas Lidotel Full, soporte para iPod, TV 32 pulgadas HD Plasma con cable,    |');
  Writeln('|banio con ducha, cafetera electrica.                                              |');
  Writeln('|Incluye: Desayuno Buffet, WIFI, piscina, gimnasio.                                |');
  WriteLn('|==================================================================================|');

  Writeln('|4. SUITE - 300$ por noche                                                         |');
  Writeln('|Calida y confortable habitacion decorada con un estilo vanguardista,              |');
  Writeln('|100% libre de humo, cama Lidotel Royal King, con reloj despertador,               |');
  Writeln('|TV 32 pulgadas HD Plasma con cable, 2 baños con ducha, cafetera electrica,        |');
  Writeln('|nevera ejecutiva.                                                                 |');
  Writeln('|Incluye: Desayuno Buffet, WIFI, piscina, gimnasio, sillas y toldos en la playa.   |');
  Writeln('|==================================================================================|');
  TextColor(White);
  WriteLn('Presione Enter para continuar');
  While ReadKey <> #13 Do
End;



Procedure GuardarRegistroIndividual(cliente: cliente);

Var 
  archivo: Text;
Begin
  Assign(archivo, 'ReservacionIndividual.txt');
  If fileExists('ReservacionIndividual.txt') Then
    Append(archivo)
  Else
    Rewrite(archivo);

  WriteLn(archivo, 'Cedula: ', cliente.cedula);
  WriteLn(archivo, 'Nombre: ', cliente.nombre);
  WriteLn(archivo, 'Apellido: ', cliente.apellido);
  WriteLn(archivo, 'Email: ', cliente.email);
  WriteLn(archivo, 'Telefono: ', cliente.telefono);
  WriteLn(archivo, 'Dias de estadia: ', cliente.dias);
  WriteLn(archivo, 'Habitacion: ', cliente.habitacion);
  WriteLn(archivo, 'Precio por noche: ', cliente.preciopornoche:0:2, ' $');
  WriteLn(archivo, 'Total a pagar: ', (cliente.dias * cliente.preciopornoche): 0:2,' $')
  ;
  WriteLn(archivo, '------------------------------------');
  Close(archivo);
  Writeln('Reservacion individual guardada correctamente.');
  Writeln('Presione Enter para continuar');
  While ReadKey <> #13 Do
End;

Procedure GuardarRegistroAcompanado(registro: clienteacompaniado);

Var 
  archivo: Text;
Begin
  Assign(archivo, 'ReservacionAcompanado.txt');
  If fileExists('ReservacionAcompanado.txt') Then
    Append(archivo)
  Else
    Rewrite(archivo);

  WriteLn(archivo, '--- Cliente Principal ---');
  WriteLn(archivo, 'Cedula: ', registro.cliente.cedula);
  WriteLn(archivo, 'Nombre: ', registro.cliente.nombre);
  WriteLn(archivo, 'Apellido: ', registro.cliente.apellido);
  WriteLn(archivo, 'Email: ', registro.cliente.email);
  WriteLn(archivo, 'Telefono: ', registro.cliente.telefono);
  WriteLn(archivo, 'Dias de estadia: ', registro.cliente.dias);
  WriteLn(archivo, 'Habitacion: ', registro.cliente.habitacion);
  WriteLn(archivo, 'Precio por noche: ', registro.cliente.preciopornoche:0:2,' $');
  WriteLn(archivo);

  WriteLn(archivo, '--- Acompaniante ---');
  WriteLn(archivo, 'Cedula: ', registro.acompaniante.cedula);
  WriteLn(archivo, 'Nombre: ', registro.acompaniante.nombre);
  WriteLn(archivo, 'Apellido: ', registro.acompaniante.apellido);
  WriteLn(archivo, 'Email: ', registro.acompaniante.email);
  WriteLn(archivo, 'Telefono: ', registro.acompaniante.telefono);
  WriteLn(archivo, 'Dias de estadia: ', registro.acompaniante.dias);
  WriteLn(archivo, 'Habitacion: ', registro.acompaniante.habitacion);
  WriteLn(archivo, 'Precio por noche: ', registro.acompaniante.preciopornoche:0:2, ' $');
  WriteLn(archivo);

  WriteLn(archivo, '------------------------------------');
  Close(archivo);

  Writeln('Reservacion acompañada guardada correctamente.');
  Writeln('Presione Enter para continuar');
  While ReadKey <> #13 Do
End;


Procedure GuardarRegistroGrupo(registro: clientegrupo);

Var 
  archivo: Text;
  i, j: Integer;
Begin
  Assign(archivo, 'ReservacionGrupo.txt');
  If fileExists('ReservacionGrupo.txt') Then
    Append(archivo)
  Else
    Rewrite(archivo);

  WriteLn(archivo, '--- Reservacion en Grupo ---');

  For i := 0 To High(registro.adultos) Do
    Begin
      WriteLn(archivo, 'Cedula: ', registro.adultos[i].cedula);
      WriteLn(archivo, '--- Adulto ', i + 1, ' ---');
      WriteLn(archivo, 'Nombre: ', registro.adultos[i].nombre);
      WriteLn(archivo, 'Apellido: ', registro.adultos[i].apellido);
      WriteLn(archivo, 'Email: ', registro.adultos[i].email);
      WriteLn(archivo, 'Telefono: ', registro.adultos[i].telefono);
      WriteLn(archivo, 'Dias de estadia: ', registro.adultos[i].dias);
      WriteLn(archivo, 'Habitacion: ', registro.adultos[i].habitacion);
      WriteLn(archivo, 'Precio por noche: ', registro.adultos[i].preciopornoche:0:2, ' $');
    End;

  For j := 0 To High(registro.ninios) Do
    Begin
      WriteLn(archivo, '--- Nino ', j + 1, ' ---');
      WriteLn(archivo, 'Nombre: ', registro.ninios[j].nombre);
      WriteLn(archivo, 'Apellido: ', registro.ninios[j].apellido);
      WriteLn(archivo, 'Edad: ', registro.ninios[j].edad);
    End;

  Close(archivo);
  Writeln('Reservacion en grupo guardada correctamente.');
  Writeln('Presione Enter para continuar');
  While ReadKey <> #13 Do
End;


Procedure BuscarCliente;

Var 
  archivo: Text;
  linea, busqueda: string;
  encontrado: Boolean;
  archivos: array[1..3] Of string;
  i: Integer;
Begin
  clrscr;
  Writeln('Ingrese la cedula completa del cliente a buscar:');
  ReadLn(busqueda);
  encontrado := False;

  archivos[1] := 'ReservacionIndividual.txt';
  archivos[2] := 'ReservacionAcompanado.txt';
  archivos[3] := 'ReservacionGrupo.txt';

  For i := 1 To 3 Do
    Begin
      If FileExists(archivos[i]) Then
        Begin
          Assign(archivo, archivos[i]);
          Reset(archivo);
          While Not EOF(archivo) Do
            Begin
              ReadLn(archivo, linea);

              If (Pos(busqueda, linea) > 0) And (Pos('Cedula:', linea) > 0) Then
                Begin
                  Writeln('Cliente encontrado en ', archivos[i]);
                  Writeln('------------------------------------');
                  Writeln(linea);


                  While Not EOF(archivo) Do
                    Begin
                      ReadLn(archivo, linea);
                      Writeln(linea);

                      If (Pos('------------------------------------', linea) > 0) Then
                        Break;
                    End;
                  encontrado := True;
                  Break;
                End;
            End;
          Close(archivo);
        End;
    End;

  If Not encontrado Then
    Writeln('No se encontro al cliente con esa cedula.');

  Writeln('Presione Enter para continuar.');
  While ReadKey <> #13 Do;
End;


Procedure EliminarDeArchivo(archivoNombre: String; cedulaEliminar: String);

Var 
  archivo, archivoTemporal: Text;
  linea, cedulaActual: String;
  encontrado: Boolean;
Begin
  Assign(archivo, archivoNombre);
  Assign(archivoTemporal, 'ReservacionTemporal.txt');

  If Not FileExists(archivoNombre) Then
    Begin
      Writeln('El archivo ', archivoNombre, ' no existe.');
      Exit;
    End;

  Reset(archivo);
  Rewrite(archivoTemporal);

  encontrado := False;

  While Not Eof(archivo) Do
    Begin
      ReadLn(archivo, linea);

      If Pos('Cedula: ', linea) = 1 Then
        Begin
          cedulaActual := Copy(linea, Pos(':', linea) + 2, Length(linea));

          If cedulaActual = cedulaEliminar Then
            Begin
              encontrado := True;

              Repeat
                ReadLn(archivo, linea);
              Until (Eof(archivo)) Or (linea =
                    '------------------------------------');

              Continue;
            End;
        End;

      WriteLn(archivoTemporal, linea);
    End;

  Close(archivo);
  Close(archivoTemporal);

  If encontrado Then
    Begin
      Erase(archivo);
      Rename(archivoTemporal, archivoNombre);
      Writeln('Reservacion eliminada correctamente del archivo ', archivoNombre);
    End
  Else
    Begin
      Erase(archivoTemporal);
      Writeln('No se encontro una reservación con esa cedula en el archivo ',archivoNombre);
    End;
End;



Procedure EliminarReservacion;

Var 
  cedulaEliminar: string;
Begin
  clrscr;
  Writeln('Ingrese la cedula del cliente cuya reservacion desea eliminar: ');
  ReadLn(cedulaEliminar);

  EliminarDeArchivo('ReservacionIndividual.txt', cedulaEliminar);
  EliminarDeArchivo('ReservacionAcompanado.txt', cedulaEliminar);
  EliminarDeArchivo('ReservacionGrupo.txt', cedulaEliminar);

  Writeln('Presione Enter para continuar.');
  While ReadKey <> #13 Do;
End;



Function SoloLetras(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  For i := 1 To Length(cadena) Do
    If Not (cadena[i] In ['A'..'Z', 'a'..'z']) Then
      Exit(False);

  Exit(True);
End;


Procedure SolicitarNombreApellido(Var cadena: String; tipo: String);
Begin
  Repeat
    clrscr;
    Writeln('Ingrese ', tipo, ': ');
    ReadLn(cadena);

    If (cadena = '') Then
      Writeln(tipo, ' no puede estar vacio. Intente nuevamente.')
    Else If Not SoloLetras(cadena) Then
      Writeln(tipo, ' solo puede contener letras. Intente nuevamente.')
    Else
      Break;

    WriteLn('Presione Enter para intentar de nuevo...');
    While ReadKey <> #13 Do;
  Until (cadena <> '') And SoloLetras(cadena);
End;



Function EsNumeroValido(numero: String): Boolean;

Var 
  i: Integer;
Begin
  For i := 1 To Length(numero) Do
    If Not (numero[i] In ['0'..'9']) Then
      Exit(False);

  Exit(True);
End;

Procedure SolicitarNumero(Var numero: String; tipo: String);
Begin
  Repeat
    clrscr;
    Writeln('Ingrese ', tipo, ': ');
    ReadLn(numero);

    If (numero = '') Then
      Writeln(tipo, ' no puede estar vacio. Intente nuevamente.')
    Else If Not EsNumeroValido(numero) Then
      Writeln(tipo, ' debe contener solo números. Intente nuevamente.')
    Else
      Break;

    WriteLn('Presione Enter para intentar de nuevo...');
    While ReadKey <> #13 Do;
  Until (numero <> '') And EsNumeroValido(numero);
End;

Function EsEmailValido(email: String): Boolean;

Var 
  a, b: Integer;
Begin
  a := Pos('@', email);
  b := Pos('.', email);

  If (a > 0) And (b > a) Then
    Exit(True)
  Else
    Exit(False);
End;

Procedure SolicitarEmail(Var email: String);
Begin
  Repeat
    clrscr;
    Writeln('Ingrese el correo electronico: ');
    ReadLn(email);

    If (email = '') Then
      Writeln('El correo electronico no puede estar vacio. Intente nuevamente.')
    Else If Not EsEmailValido(email) Then
      Writeln('El correo electronico debe tener un formato valido (por ejemplo, ejemplo@dominio.com). Intente nuevamente.')
    Else
      Break;

    WriteLn('Presione Enter para intentar de nuevo...');
    While ReadKey <> #13 Do;
  Until (email <> '') And EsEmailValido(email);

End;



Procedure ReservarCliente(Var cliente: cliente);
Begin
  
  If habitacionesOcupadas >= LIMITE_HABITACIONES Then
    Begin
      Writeln('No hay más habitaciones disponibles. Límite alcanzado de ',LIMITE_HABITACIONES, ' habitaciones.');
      Writeln('Presione Enter para continuar');
      While ReadKey <> #13 Do
        Exit;
    End;

  clrscr;
  SolicitarNombreApellido(cliente.nombre,'Nombre'); 

  clrscr;
  SolicitarNombreApellido(cliente.apellido,'Apellido');

  clrscr;
  SolicitarNumero(cliente.cedula, 'Cedula');

  clrscr;
  SolicitarEmail(cliente.email);

  clrscr;
  SolicitarNumero(cliente.telefono,'Telefono');
  
  clrscr;
  Writeln('Ingrese la cantidad de dias de estadia: ');
  ReadLn(cliente.dias);

  MostrarDetallesHabitaciones();

  clrscr;
  Writeln('Seleccione tipo de habitaciones: ');
  Writeln('1. FAMILY ROOM - 200$ por noche');
  Writeln('2. SENCILLA - 60$ por noche');
  Writeln('3. DOBLE - 120$ por noche');
  Writeln('4. SUITE - 300$ por noche');
  Writeln('Seleccione: ');
  ReadLn(subopcion);

  Case subopcion Of 
    1:
       Begin
         cliente.habitacion := 'FAMILY ROOM';
         cliente.preciopornoche := 200;
       End;
    2:
       Begin
         cliente.habitacion := 'SENCILLA';
         cliente.preciopornoche := 60;
       End;
    3:
       Begin
         cliente.habitacion := 'DOBLE';
         cliente.preciopornoche := 120;
       End;
    4:
       Begin
         cliente.habitacion := 'SUITE';
         cliente.preciopornoche := 300;
       End;
    Else
      Writeln('Opcion invalida.');
    exit;
  End;

  Inc(habitacionesOcupadas);

  Writeln('Datos de la reservacion:');
  Writeln('Nombre: ', cliente.nombre);
  Writeln('Apellido: ', cliente.apellido);
  Writeln('Cedula: ', cliente.cedula);
  Writeln('Email: ', cliente.email);
  Writeln('Telefono: ', cliente.telefono);
  Writeln('Dias de estadia: ', cliente.dias);
  Writeln('Habitacion: ', cliente.habitacion);
  Writeln('Precio por noche: ', cliente.preciopornoche:0:2, ' $');
  Writeln('Total a pagar: ', (cliente.dias * cliente.preciopornoche):0:2,' $' );
  WriteLn('Presione Enter para continuar');

  GuardarRegistroIndividual(cliente);
End;


Procedure ReservarAcompaniado(Var registro: clienteacompaniado);
Begin

  If habitacionesOcupadas >= LIMITE_HABITACIONES Then
  Begin
    Writeln('No hay más habitaciones disponibles. Límite alcanzado de ',LIMITE_HABITACIONES, ' habitaciones.');
    Writeln('Presione Enter para continuar');
    While ReadKey <> #13 Do
      Exit;
  End;


  Writeln('--- Reservacion Cliente Principal ---');
  SolicitarNombreApellido(registro.cliente.nombre, 'Nombre');

  clrscr;
  SolicitarNombreApellido(registro.cliente.apellido, 'Apellido');

  clrscr;
  SolicitarNumero(registro.cliente.cedula, 'Cedula');

  clrscr;
  SolicitarEmail(registro.cliente.email);

  clrscr;
  SolicitarNumero(registro.cliente.telefono, 'Telefono');

  clrscr;
  Writeln('Ingrese la cantidad de dias de estadia: ');
  ReadLn(registro.cliente.dias);

  MostrarDetallesHabitaciones();

  clrscr;
  Writeln('Seleccione tipo de habitaciones: ');
  Writeln('1. FAMILY ROOM - 200$ por noche');
  Writeln('2. SENCILLA - 60$ por noche');
  Writeln('3. DOBLE - 120$ por noche');
  Writeln('4. SUITE - 300$ por noche');
  Writeln('Seleccione: ');
  ReadLn(subopcion);

  Case subopcion Of 
    1:
       Begin
         registro.cliente.habitacion := 'FAMILY ROOM';
         registro.cliente.preciopornoche := 200;
       End;
    2:
       Begin
         registro.cliente.habitacion := 'SENCILLA';
         registro.cliente.preciopornoche := 60;
       End;
    3:
       Begin
         registro.cliente.habitacion := 'DOBLE';
         registro.cliente.preciopornoche := 120;
       End;
    4:
       Begin
         registro.cliente.habitacion := 'SUITE';
         registro.cliente.preciopornoche := 300;
       End;
    Else
      Writeln('Opcion invalida.');
    exit;


  End;

  Inc(habitacionesOcupadas);


  Writeln('--- Datos del acompaniante ---');

  clrscr;
  SolicitarNombreApellido(registro.acompaniante.nombre, 'Nombre');

  clrscr;
  SolicitarNombreApellido(registro.acompaniante.apellido, 'Apellido');

  clrscr;
  SolicitarNumero(registro.acompaniante.cedula, 'Cedula');

  clrscr;
  SolicitarEmail(registro.acompaniante.email);

  clrscr;
  SolicitarNumero(registro.acompaniante.telefono, 'Telefono');

  registro.acompaniante.dias := registro.cliente.dias;
  registro.acompaniante.habitacion := registro.cliente.habitacion;
  registro.acompaniante.preciopornoche := registro.cliente.preciopornoche;

  clrscr;
  Writeln('====== Datos de la reservacion ======:');
  Writeln('--- Datos del cliente ---');
  Writeln('Nombre: ', registro.cliente.nombre);
  Writeln('Apellido: ', registro.cliente.apellido);
  Writeln('Cedula: ', registro.cliente.cedula);
  Writeln('Email: ', registro.cliente.email);
  Writeln('Telefono: ', registro.cliente.telefono);
  Writeln('Dias de estadia: ', registro.cliente.dias);
  Writeln('Habitacion: ', registro.cliente.habitacion);
  Writeln('Precio por noche: ', registro.cliente.preciopornoche:0:2,' $');
  WriteLn('Presione Enter para continuar');

  WriteLn;

  Writeln('--- Datos del acompaniante ---');
  Writeln('Nombre: ', registro.acompaniante.nombre);
  Writeln('Apellido: ', registro.acompaniante.apellido);
  Writeln('Cedula: ', registro.acompaniante.cedula);
  Writeln('Email: ', registro.acompaniante.email);
  Writeln('Telefono: ', registro.acompaniante.telefono);
  Writeln('Dias de estadia: ', registro.acompaniante.dias);
  Writeln('Habitacion: ', registro.acompaniante.habitacion);
  Writeln('Precio por noche: ', registro.acompaniante.preciopornoche:0:2, ' $');
  Writeln('Total a pagar: ', (registro.acompaniante.dias * registro.acompaniante.preciopornoche):0:2,' $');

  GuardarRegistroAcompanado(registro);
End;


Procedure ReservarGrupo(Var registro: clientegrupo);

Var 
  montoTotal: Real;
Begin

  If habitacionesOcupadas >= LIMITE_HABITACIONES Then
  Begin
    Writeln('No hay más habitaciones disponibles. Límite alcanzado de ', LIMITE_HABITACIONES, ' habitaciones.');
    Writeln('Presione Enter para continuar');
    While ReadKey <> #13 Do;
    Exit;
  End;

  Writeln('Ingrese la cantidad de adultos: ');
  ReadLn(cantidadadultos);
  SetLength(registro.adultos, cantidadadultos);

  MostrarDetallesHabitaciones();  

  ClrScr;
  Writeln('Seleccione tipo de habitaciones: ');
  Writeln('1. FAMILY ROOM - 200$ por noche');
  Writeln('2. SENCILLA - 60$ por noche');
  Writeln('3. DOBLE - 120$ por noche');
  Writeln('4. SUITE - 300$ por noche');
  Writeln('Seleccione: ');
  ReadLn(subopcion);

  Case subopcion Of 
    1:
       Begin
         registro.adultos[0].habitacion := 'FAMILY ROOM';
         registro.adultos[0].preciopornoche := 200;
       End;
    2:
       Begin
         registro.adultos[0].habitacion := 'SENCILLA';
         registro.adultos[0].preciopornoche := 60;
       End;
    3:
       Begin
         registro.adultos[0].habitacion := 'DOBLE';
         registro.adultos[0].preciopornoche := 120;
       End;
    4:
       Begin
         registro.adultos[0].habitacion := 'SUITE';
         registro.adultos[0].preciopornoche := 300;
       End;
    Else
      Begin
        Writeln('Opción inválida.');
        Exit;
      End;
  End;

  Inc(habitacionesOcupadas);

  Writeln('Ingrese Dias de estadia para todo el grupo: ');
  ReadLn(registro.adultos[0].dias);


  For i := 0 To cantidadadultos - 1 Do
    Begin
      Writeln('--- Datos del adulto ', i + 1, ' ---');
      clrscr;
      Writeln('Ingrese Nombre: ');
      ReadLn(registro.adultos[i].nombre);
      clrscr;
      Writeln('Ingrese Apellido: ');
      ReadLn(registro.adultos[i].apellido);
      clrscr;
      Writeln('Ingrese Cedula: ');
      ReadLn(registro.adultos[i].cedula);
      clrscr;
      Writeln('Ingrese Email: ');
      ReadLn(registro.adultos[i].email);
      clrscr;
      Writeln('Ingrese Telefono: ');
      ReadLn(registro.adultos[i].telefono);
      registro.adultos[i].habitacion := registro.adultos[0].habitacion;
      registro.adultos[i].dias := registro.adultos[0].dias;
      registro.adultos[i].preciopornoche := registro.adultos[0].preciopornoche;
    End;
  clrscr;
  Writeln('¿Tiene hijos? (1. Si / 2. No): ');
  ReadLn(subopcion);

  If subopcion = 1 Then
    Begin
      clrscr;
      Writeln('Ingrese la cantidad de hijos: ');
      ReadLn(cantidadhijos);
      SetLength(registro.ninios, cantidadhijos);

      For i := 0 To cantidadhijos - 1 Do
        Begin
          clrscr;
          Writeln('--- Datos del hijo ', i + 1, ' ---');
          Writeln('Ingrese Nombre: ');
          ReadLn(registro.ninios[i].nombre);
          clrscr;
          Writeln('Ingrese Apellido: ');
          ReadLn(registro.ninios[i].apellido);
          clrscr;
          Writeln('Ingrese Edad: ');
          ReadLn(registro.ninios[i].edad);
        End;
    End;

  montoTotal := 0;
  For i := 0 To cantidadadultos - 1 Do
    Begin
      montoTotal := montoTotal + (registro.adultos[i].preciopornoche * registro.adultos[i].dias);
    End;

  Writeln('Monto total para el grupo: ', montoTotal:0:2, ' $');

  GuardarRegistroGrupo(registro);
End;


Begin
  habitacionesOcupadas := 0;
  clrscr;
  MostrarBienvenida ();
  Repeat
    MostrarMenu();
    ReadLn(opcion);
    Case opcion Of 
      1:
         Begin
           MostrarTipoReservacion;
           ReadLn(subopcion);
           Case subopcion Of 
             1:
                Begin
                  Writeln('--- Reservacion Individual ---');
                  ReservarCliente(nuevocliente);
                End;
             2:
                Begin
                  Writeln('--- Reservacion Acompañado ---');
                  ReservarAcompaniado(nuevoacompaniante);
                End;
             3:
                Begin
                  Writeln('--- Reservacion Grupo/Familia ---');
                  ReservarGrupo(nuevogrupo);
                End;
             Else
               Writeln('Opción inválida.');
           End;
         End;
      2:
         Begin
           Writeln('--- Buscar Cliente ---');
           BuscarCliente;
         End;
      3:
         Begin
           Writeln('--- Eliminar Reservacion ---');
           EliminarReservacion;
         End;
      4: 
        Begin
          MostrarSalida;
          Exit;
        End;
    End;
  Until False;
End.

