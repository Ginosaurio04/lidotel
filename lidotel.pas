program lidotel;

uses crt, sysutils;

type
  cliente = record
    nombre: string;
    apellido: String;
    cedula: string;
    email: string;
    telefono: string;
    dias: integer;
    habitacion: String;
    preciopornoche: real;
  end;

 clienteacompaniado=record
   cliente:cliente;
  acompaniante: cliente;
 end;

clientegrupo= record
  adultos: array of cliente;
  ninios: array of cliente;
    nombre: String;
    apellido: String;
  end;
  cantidadhijos= Integer;
end;
var
  opcion: integer;
  nuevocliente: cliente;
  nuevoacompaniante: clienteacompaniado;
  nuevogrupo: clientegrupo;

procedure MostrarMenu();
begin
  WriteLn('1.Nuevo cliente');
  WriteLn('2.salir');
  WriteLn('Seleccione una opcion');
end;

procedure ReservarCliente(var cliente: cliente);
begin
  writeln('Ingrese Nombre: ');
  ReadLn(cliente.nombre);
  WriteLn('Ingrese apellido: ');
  readln(cliente.apellido);
  WriteLn('Ingrese la cedula: ');
  readln(cliente.cedula);
  WriteLn('Ingrese email: ');
  readln(cliente.email);
  WriteLn('Ingrese el telefono: ');
  ReadLn(cliente.telefono);
  writeln('Ingrese la cantidad de dias de estadia: ');
  ReadLn(cliente.dias);
  WriteLn('Seleccione tipo de habitaciones: ');
  WriteLn('1. FAMILY ROOM - 200$ por noche');
  WriteLn('2. SENCILLA - 60$ por noche');
  WriteLn('3. DOBLE - 120$ por noche');
  WriteLn('4. SUITE - 300$ por noche');
  WriteLn('Seleccione: ');
  ReadLn(opcion);
  case opcion of 
    1:begin
      cliente.habitacion := 'FAMILY ROOM';
      cliente.preciopornoche := 200
    end;
    2:begin
      cliente.habitacion := 'SENCILLA';
      cliente.precio := 60
    end;
    3:begin
      cliente.habitacion := 'DOBLE';
      cliente.preciopornoche := 120
    end;
    4:begin
      cliente.habitacion := 'SUITE';
      cliente.preciopornoche := 300
    end;
  end;
  writeln('Datos de la reservacion:');
  WriteLn('Nombre: ', cliente.nobre);
  WriteLn('Apellido: ', cliente.apellido);
  WriteLn('Cedula: ', cliente.cedula);
  WriteLn('Email: ', cliente.email);
  WriteLn('Telefono: ', cliente.telefono);
  WriteLn('Dias de estadia: ', cliente.dias);
  WriteLn('Habitacion: ', cliente.habitacion);
  WriteLn('Precio por noche: ', cliente.preciopornoche:0:2, '$');
  WriteLn('Total a pagar: ', cliente.dias * cliente.preciopornoche:0:2, '$');
end;

procedure ReservarAcompaniado(var cliente: clienteacompaniado);
begin
  ReservarCliente(cliente.cliente);

  WriteLn('Datos del acompaniante:');
  writeln('Ingrese el nombre: ');
  ReadLn(cliente.acompaniante.nombre);
  WriteLn('Ingrese el Apellido: ');
  ReadLn(cliente.acompaniante.apellido);
  WriteLn('Ingrese cedula:');
  ReadLn(cliente.acompaniante.cedula);
  WriteLn('Ingrese email:');
  ReadLn(cliente.acompaniante.email);
  writeln('ingrese telefono:');
  ReadLn(cliente.acompaniante.telefono);

  cliente.acompaniante.dias := cliente.cliente.dias;
  cliente.acompaniante.habitacion := cliente.cliente.habitacion;
  cliente.acompaniante.preciopornoche := cliente.cliente.preciopornoche;

  WriteLn('Datos de la reservacion del acompañante:');
  WriteLn('Nombre: ', cliente.acompaniante.nombre);
  WriteLn('Apellido: ', cliente.acompaniante.apellido);
  WriteLn('Cedula: ', cliente.acompaniante.cedula);
  WriteLn('Enail: ', cliente.acompaniante.email);
  WriteLn('Telefono: ', cliente.acompaniante.telefono);
  WriteLn('Dias de estadia: ', cliente.acompaniante.dias);
  WriteLn('Habitacion: ', cliente.acompaniante.habitacion);
  WriteLn('Precio por noche: ', cliente.acompaniante,preciopornoche:0:2, '$');
  WriteLn('Total a pagar: ', cliente.acompaniante.dias * cliente.acompaniante.preciopornoche:0:2, '$');
end;

procedure ReservarGrupo(var cliente: clientegrupo);
var
  i: Integer;
begin
  writeln('Ingrese la cantidad de adultos: ');
  readln(Length(cliente.adultos));
  SetLength(cliente.adultos, cliente.cantidadadultos);

  for i := 0 to cliente.cantidadadultos - 1 do
  begin
    writeln('Datos del adulto', i + 1, ':');
    ReservarCliente(cliente.adultos[i]);
  end;

  WriteLn('¿Tiene hijos? (1. Si / 2. No): ');
  ReadLn(opcion);
  if opcion = 1 then
    begin
      WriteLn('Ingrese la cantidad de hijos: ');
      ReadLn(cliente.cantidadhijos);
      SetLength(cliente.hijos, cliente.cantidadhijos);

      for i := 0 to cliente.cantidadhijos - 1 do
      begin
        WriteLn('Datos del hijo', i + 1, ':');
        WriteLn('Ingrese nombre: ');
        ReadLn(cliente.hijos[i].nombre);
        WriteLn('Ingrese apellido: ');
        ReadLn(cliente.hijos[i].apellido);
        WriteLn('Ingrese edad: ');
        ReadLn(cliente.hijos[i].edad);
      end;
    end;
end;

begin
  repeat
    clrscr:
    mostrarMenu();
    ReadLn(opcion);

    case opcion of 
      WriteLn('Seleccione el tipo de reservacion:');
      WriteLn('1. Individual');
      WriteLn('2. Acompaniado');
      WriteLn('3. Grupo/Familia');
      WriteLn('Seleccione: ');
      ReadLn(opcion);

      case opcion of 
        1:ReservarCliente(nuevoCliente);
        2:ReservarAcompaniante(nuevoAcompaniando)
        3:ReservarGrupo(nuevoGrupo);
       end;

       WriteLn('¡Gracias por su reservacion!');
       ReadLn;
     end;
    end;
  until opcion = 2;
end.



