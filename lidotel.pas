program lidotel;

type
  cliente = record
    nombre: string;
    apellido: String;
  end;

  habitacion = record
    numero: Integer;
    ocupada: Boolean;
    nombrehuesped: string;
  end;

  reservacion = record
    numero: Integer;
    habitacion: habitacion;
    cliente: cliente;
    fecha: Word;
  end;

var
  persona: cliente;
  habitaciones: array[1..300] of habitacion;
  opcion: Integer;
  numerohabitacion: Integer;

procedure inicializarhabitaciones;
begin
  for var i := 1 to 300 do
  begin
    habitaciones[i].numero := i;
    habitaciones[i].ocupada := False;
    habitaciones[i].nombrehuesped := '';
  end;
end;

procedure mostrarhabitacioneslibres;
begin
  writeln('Habitaciones libres:');
  for var i := 1 to 300 do
    if not habitaciones[i].ocupada then
      writeln('Habitacion ', habitaciones[i].numero);
end;

procedure reservarhabitacion;
begin
  writeln('Ingrese el numero de la habitacion a reservar, por favor:');
  ReadLn(numerohabitacion);
  if (numerohabitacion < 1) or (numerohabitacion > 300) then
    WriteLn('Numero de habitacion invalido')
  else if habitaciones[numerohabitacion].ocupada then
    WriteLn('La habitacion ya esta ocupada')
  else
  begin
    WriteLn('Ingrese el nombre del huesped:');
    ReadLn(habitaciones[numerohabitacion].nombrehuesped);
    habitaciones[numerohabitacion].ocupada := True;
    WriteLn('Habitacion ha sido reservada exitosamente');
  end;
end;

procedure liberarhabitacion;
begin
  WriteLn('Ingrese el numero de la habitacion a liberar, por favor: ');
  ReadLn(numerohabitacion);
  if (numerohabitacion < 1) or (numerohabitacion > 300) then
    WriteLn('Numero de habitacion invalido')
  else if not habitaciones[numerohabitacion].ocupada then
    WriteLn('La habitacion ya esta libre')
  else
  begin
    habitaciones[numerohabitacion].ocupada := False;
    habitaciones[numerohabitacion].nombrehuesped := '';
    WriteLn('Habitacion ha sido liberada exitosamente');
  end; 
end;

begin
  inicializarhabitaciones;
  repeat
    WriteLn('Menu de reservas');
    WriteLn('1. Mostrar habitaciones libres');
    WriteLn('2. Reservar habitacion');
    WriteLn('3. Liberar habitacion');
    WriteLn('4. Salir');
    ReadLn(opcion);
    case opcion of
      1: mostrarhabitacioneslibres;
      2: reservarhabitacion;
      3: liberarhabitacion;
    end;
  until opcion = 4;
end.



