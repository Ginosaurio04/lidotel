Program lidotel;

Uses crt, sysutils;

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

Var 
  opcion, subopcion, cantidadadultos, cantidadhijos, i: integer;
  nuevocliente: cliente;
  nuevoacompaniante: clienteacompaniado;
  nuevogrupo: clientegrupo;
  archivo: Text;
Procedure MostrarBienvenida;
begin
  ClrScr;
  TextColor(LightBlue);
  WriteLn('|==================================================|');
  WriteLn('|===               BIENVENIDOS AL               ===|');
  WriteLn('|===      HOTEL LIDOTEL BOUTIQUE MARGARITA      ===|');
  WriteLn('|==================================================|');
  TextColor(White);
  WriteLn('Presiones Enter para comenzar...');
  while ReadKey <> #13 do;
end;


Procedure MostrarSalida;
begin
  ClrScr;
  TextColor(LightBlue);
  WriteLn('|==================================================|');
  WriteLn('|===                                            ===|');
  WriteLn('|===            ESTAMOS PARA SERVIRLE.          ===|');
  WriteLn('|===                                            ===|');
  WriteLn('|==================================================|');
  TextColor(White);
  Sleep(3000);
  while ReadKey <> #13 do;
end;  


Procedure MostrarMenu();
Begin
  clrscr;
  TextColor(LightGreen);
  Writeln('==== Lidotel Boutique Margarita ====');
  Writeln('|1. Nuevo cliente                  |');
  WriteLn('|==================================|');
  Writeln('|2. Buscar cliente                 |');
  WriteLn('|==================================|');
  Writeln('|3. Salir                          |');
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
  Writeln('|1. FAMILY ROOM - 200$ por noche                                                   |');
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

  WriteLn(archivo, 'Nombre: ', cliente.nombre);
  WriteLn(archivo, 'Apellido: ', cliente.apellido);
  WriteLn(archivo, 'Cedula: ', cliente.cedula);
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
  WriteLn(archivo, 'Nombre: ', registro.cliente.nombre);
  WriteLn(archivo, 'Apellido: ', registro.cliente.apellido);
  WriteLn(archivo, 'Cedula: ', registro.cliente.cedula);
  WriteLn(archivo, 'Email: ', registro.cliente.email);
  WriteLn(archivo, 'Telefono: ', registro.cliente.telefono);
  WriteLn(archivo, 'Dias de estadia: ', registro.cliente.dias);
  WriteLn(archivo, 'Habitacion: ', registro.cliente.habitacion);
  WriteLn(archivo, 'Precio por noche: ', registro.cliente.preciopornoche:0:2,' $');
  WriteLn(archivo);

  WriteLn(archivo, '--- Acompaniante ---');
  WriteLn(archivo, 'Nombre: ', registro.acompaniante.nombre);
  WriteLn(archivo, 'Apellido: ', registro.acompaniante.apellido);
  WriteLn(archivo, 'Cedula: ', registro.acompaniante.cedula);
  WriteLn(archivo, 'Email: ', registro.acompaniante.email);
  WriteLn(archivo, 'Telefono: ', registro.acompaniante.telefono);
  WriteLn(archivo, 'Dias de estadia: ', registro.acompaniante.dias);
  WriteLn(archivo, 'Habitacion: ', registro.acompaniante.habitacion);
  WriteLn(archivo, 'Precio por noche: ', registro.acompaniante.preciopornoche:0:2, ' $');
  WriteLn(archivo);

  WriteLn(archivo, '------------------------------------');
  Close(archivo);

  Writeln('Reservacion acompanada guardada correctamente.');
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

  // Guardar los adultos
  For i := 0 To High(registro.adultos) Do
    Begin
      WriteLn(archivo, '--- Adulto ', i + 1, ' ---');
      WriteLn(archivo, 'Nombre: ', registro.adultos[i].nombre);
      WriteLn(archivo, 'Apellido: ', registro.adultos[i].apellido);
      WriteLn(archivo, 'Cedula: ', registro.adultos[i].cedula);
      WriteLn(archivo, 'Email: ', registro.adultos[i].email);
      WriteLn(archivo, 'Telefono: ', registro.adultos[i].telefono);
      WriteLn(archivo, 'Dias de estadia: ', registro.adultos[i].dias);
      WriteLn(archivo, 'Habitacion: ', registro.adultos[i].habitacion);
      WriteLn(archivo, 'Precio por noche: ', registro.adultos[i].preciopornoche:0:2, ' $');
    End;

  // Guardar los niños
  For j := 0 To High(registro.ninios) Do
    Begin
      WriteLn(archivo, '--- Niño ', j + 1, ' ---');
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
  encontrado, clienteCompleto: Boolean;
Begin
  clrscr;
  Writeln('Ingrese cédula o nombre del cliente a buscar:');
  ReadLn(busqueda);
  encontrado := False;
  clienteCompleto := False;

  Assign(archivo, 'registros.txt');
  {$I-}
  // Desactiva manejo automático de errores
  Reset(archivo);
  {$I+}
  // Reactiva manejo automático de errores

  If IOResult <> 0 Then
    Begin
      Writeln('No se pudo abrir el archivo. Asegúrese de que el archivo exista.');
      Writeln('Presione Enter para continuar...');
      While ReadKey <> #13 Do;
      Exit;
    End;

  While Not EOF(archivo) Do
    Begin
      ReadLn(archivo, linea);


 // Si encontramos el cliente, mostramos toda la información hasta el separador
      If (Pos(busqueda, linea) > 0) Then
        Begin
          encontrado := True;
          clienteCompleto := True;
        End;

      If clienteCompleto Then
        Begin
          Writeln(linea);
          If (linea = '------------------------------------') Then
            Break;
        End;
    End;

  If Not encontrado Then
    Writeln('No se encontró el cliente.');

  Close(archivo);

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
  TextColor(LightGreen);
  WriteLn('===================================');
  Writeln('|Seleccione tipo de habitaciones: |');
  WriteLn('|=================================|');
  Writeln('|1. FAMILY ROOM - 200$ por noche  |');
  WriteLn('|=================================|');
  Writeln('|2. SENCILLA - 60$ por noche      |');
  WriteLn('|=================================|');
  Writeln('|3. DOBLE - 120$ por noche        |');
  WriteLn('|=================================|');
  Writeln('|4. SUITE - 300$ por noche        |');
  WriteLn('|=================================|');
  TextColor(white);
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
  While ReadKey <> #13 Do
End;


Procedure ReservarAcompaniado(Var registro: clienteacompaniado);
Begin
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
  TextColor(LightGreen);
  WriteLn('===================================');
  Writeln('|Seleccione tipo de habitaciones: |');
  WriteLn('|=================================|');
  Writeln('|1. FAMILY ROOM - 200$ por noche  |');
  WriteLn('|=================================|');
  Writeln('|2. SENCILLA - 60$ por noche      |');
  WriteLn('|=================================|');
  Writeln('|3. DOBLE - 120$ por noche        |');
  WriteLn('|=================================|');
  Writeln('|4. SUITE - 300$ por noche        |');
  WriteLn('|=================================|');
  TextColor(White);
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
  Writeln('Total a pagar: ', (registro.cliente.dias * registro.cliente.preciopornoche):0:2,' $');
  WriteLn('Presione Enter para continuar');

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
Begin
  Writeln('Ingrese la cantidad de adultos: ');
  ReadLn(cantidadadultos);
  SetLength(registro.adultos, cantidadadultos);

  For i := 0 To cantidadadultos - 1 Do
    Begin
      Writeln('--- Datos del adulto ', i + 1, ' ---');
      ReservarCliente(registro.adultos[i]);
    End;

  Writeln('¿Tiene hijos? (1. Si / 2. No): ');
  ReadLn(subopcion);

  If subopcion = 1 Then
    Begin
      Writeln('Ingrese la cantidad de hijos: ');
      ReadLn(cantidadhijos);
      SetLength(registro.ninios, cantidadhijos);

      For i := 0 To cantidadhijos - 1 Do
        Begin
          Writeln('--- Datos del hijo ', i + 1, ' ---');
          Writeln('Ingrese Nombre: ');
          ReadLn(registro.ninios[i].nombre);
          Writeln('Ingrese Apellido: ');
          ReadLn(registro.ninios[i].apellido);
          Writeln('Ingrese Edad: ');
          ReadLn(registro.ninios[i].edad);
        End;
    End;
    GuardarRegistroGrupo(nuevogrupo);
End;


Begin
  clrscr;
  Repeat
    MostrarBienvenida;
    MostrarMenu();
    ReadLn(opcion);
    MostrarSalida;
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
      3: Exit;
      Else
        Writeln('Opcion invalida.');
    End;
  Until False;
End.
