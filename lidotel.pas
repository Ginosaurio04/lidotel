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
  archivo: TextFile;

Procedure MostrarMenu();
Begin
  clrscr;
  Writeln('==== Lidotel Boutique Margarita ====');
  Writeln('1. Nuevo cliente');
  Writeln('2. Buscar cliente');
  Writeln('3. Salir');
  Writeln('Seleccione una opcion:');
End;


Procedure MostrarTipoReservacion();
Begin
  clrscr;
  Writeln('Seleccione el tipo de reservacion:');
  Writeln('1. Individual');
  Writeln('2. Acompaniado');
  Writeln('3. Grupo/Familia');
  Writeln('Seleccione: ');
End;


Procedure MostrarDetallesHabitaciones();
Begin
  clrscr;
  Writeln('==== Detalles de las habitaciones ====');
  Writeln('1. FAMILY ROOM - 200$ por noche');
  Writeln('Calida y confortable habitacion decorada con un estilo vanguardista,');
  Writeln('100% libre de humo, cama Lidotel Royal King, con reloj despertador,');
  Writeln('TV 32 pulgadas HD Plasma con cable, banio con ducha, cafetera electrica,');
  Writeln('nevera ejecutiva, caja electrónica de seguridad y secador de cabello.');
  Writeln('Incluye: Desayuno Buffet, WIFI, piscina, gimnasio, sillas y toldos en la playa.');
  Writeln;

  Writeln('2. SENCILLA - 60$ por noche');
  Writeln('Amplia y confortable habitacion decorada con un estilo vanguardista,');
  Writeln('cama Lidotel Royal King con sábanas de algodón egipcio, soporte para iPod,');
  Writeln('TV 32 pulgadas HD Plasma con cable, banio con ducha, cafetera electrica.');
  Writeln('Incluye: Desayuno Buffet, WIFI, piscina, gimnasio.');
  Writeln;

  Writeln('3. DOBLE - 120$ por noche');
  Writeln('Amplia y confortable habitacion decorada con un estilo vanguardista,');
  Writeln('Dos Camas Lidotel Full, soporte para iPod, TV 32 pulgadas HD Plasma con cable,');
  Writeln('banio con ducha, cafetera electrica.');
  Writeln('Incluye: Desayuno Buffet, WIFI, piscina, gimnasio.');
  Writeln;

  Writeln('4. SUITE - 300$ por noche');
  Writeln('Calida y confortable habitacion decorada con un estilo vanguardista,');
  Writeln('100% libre de humo, cama Lidotel Royal King, con reloj despertador,');
  Writeln('TV 32 pulgadas HD Plasma con cable, 2 baños con ducha, cafetera electrica,');
  Writeln('nevera ejecutiva.');
  Writeln('Incluye: Desayuno Buffet, WIFI, piscina, gimnasio, sillas y toldos en la playa.');
  Writeln('========================================');
  WriteLn('Presione Enter para continuar');
  While ReadKey <> #13 Do
End;


Procedure GuardarRegistro(cliente: cliente);

Begin
  Assign(archivo, 'registros.txt');
  if fileExists('registros.txt') then
    Append(archivo)
  else 
    Rewrite(archivo);

  WriteLn(archivo, 'Nombre: ', cliente.nombre);
  WriteLn(archivo, 'Apellido: ', cliente.apellido);
  WriteLn(archivo, 'Cedula: ', cliente.cedula);
  WriteLn(archivo, 'Email: ', cliente.email);
  WriteLn(archivo, 'Telefono: ', cliente.telefono);
  WriteLn(archivo, 'Dias de estadia: ', cliente.dias);
  WriteLn(archivo, 'Habitacion: ', cliente.habitacion);
  WriteLn(archivo, 'Precio por noche: ', cliente.preciopornoche:0:2, ' $');
  WriteLn(archivo, 'Total a pagar: ', (cliente.dias * cliente.preciopornoche):0:2,' $');
  WriteLn(archivo, '------------------------------------');
  WriteLn('Archivo guardado correctamente');
  Close(archivo); 
End;

Procedure BuscarCliente;

Var 
  archivo: TextFile;
  linea, busqueda: string;
  encontrado: Boolean;
Begin
  clrscr;
  Writeln('Ingrese cédula o nombre del cliente a buscar:');
  ReadLn(busqueda);
  encontrado := False;
  Assign(archivo, 'registros.txt');
  Reset(archivo);  
  While Not EOF(archivo) Do
    Begin
      ReadLn(archivo, linea);
      If Pos(busqueda, linea) > 0 Then
        Begin
          Writeln(linea);  
          encontrado := True;
        End;
    End;
  If Not encontrado Then
    Writeln('No se encontró el cliente.');
  Close(archivo); 
  Writeln('Presione Enter para continuar.');
  While ReadKey <> #13 Do
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
  While ReadKey <> #13 Do
GuardarRegistro(cliente);
End;

Procedure ReservarAcompaniado(Var registro: clienteacompaniado);
Begin
  Writeln('--- Reservacion Cliente Principal ---');
  ReservarCliente(registro.cliente);

  Writeln('--- Datos del acompaniante ---');
  
  clrscr;
  SolicitarNombreApellido(registro.acompaniante.nombre,'Nombre');

  clrscr;
  SolicitarNombreApellido(registro.acompaniante.apellido,'Apellido');

  clrscr;
  SolicitarNumero(registro.acompaniante.cedula,'Cedula');

  clrscr;
  SolicitarEmail(registro.acompaniante.email);

  clrscr;
  SolicitarNumero(registro.acompaniante.telefono,'Telefono');

  registro.acompaniante.dias := registro.cliente.dias;
  registro.acompaniante.habitacion := registro.cliente.habitacion;
  registro.acompaniante.preciopornoche := registro.cliente.preciopornoche;

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

  GuardarRegistro(registro.cliente);
  GuardarRegistro(registro.acompaniante);
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
End;


Begin
  clrscr;
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
      3: Exit;
      Else
        Writeln('Opcion invalida.');
    End;
  Until False;
End.
