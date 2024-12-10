program HotelReservation;

uses crt;

type
    TClient = record
        Nombre: string;
        Apellido: string;
        cedula: string;
        telefono: string;
        Email: string;
        estadia: integer;
    end;

var
    client: TClient;
    roomType: string;
    numPersons, Noches, Costototal, availableRooms: integer;
    option: integer;

begin
    availableRooms := 155;

    repeat
        clrscr;
        writeln('Reservacion');
        writeln('1. Nuevo cliente');
        writeln('2. Cliente existente');
        writeln('3. Salir');
        write('Selecciona una opcion: ');
        readln(option);

        case option of
            1: begin
                writeln('Ingrese sus datos:');
                write('Nombre: '); readln(client.Nombre);
                write('Apellido: '); readln(client.Apellido);
                write('cedula: '); readln(client.cedula);
                write('telefono: '); readln(client.telefono);
                write('Email: '); readln(client.Email);
                write('Numeros de personas: '); readln(numPersons);
                write('Noches de estadia: '); readln(Noches);
                
                writeln('Select Room Type:');
                writeln('1. Familiar - $200');
                writeln('2. Individual - $60');
                writeln('3. Doble - $120');
                writeln('4. Suite - $300');
                write('Selecciona una opcion: ');
                readln(roomType);

                case roomType of
                    '1': Costototal := 200 * Noches;
                    '2': Costototal := 60 * Noches;
                    '3': Costototal := 120 * Noches;
                    '4': Costototal := 300 * Noches;
                end;

                writeln('Reservation Details:');
                writeln('nombre: ', client.nombre, ' ', client.nombre);
                writeln('cedula: ', client.cedula);
                writeln('telefono: ', client.telefono);
                writeln('Email: ', client.Email);
                writeln('Noches de estadia: ', Noches);
                writeln('Costo total: $', Costototal);
                availableRooms := availableRooms - numPersons;
                writeln('Available Rooms: ', availableRooms);
                readln;
            end;

            2: begin
                writeln('Enter your ID Number to retrieve reservation:');
                readln(client.cedula);
                // Here you would typically retrieve the reservation details from a database
                writeln('Mostrando reserva para cedula: ', client.cedula);
                // Placeholder for actual data retrieval
                readln;
            end;

            3: begin
                writeln('Exiting the program.');
            end;

            else
                writeln('Invalid option, please try again.');
        end;

    until option = 3;
end.