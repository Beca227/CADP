program ejer1Registros;
{
 Un centro de deportes quiere procesar la informaci�n de sus clientes y de los 4 tipos de actividades que ofrece: 1) Musculaci�n, 
 * 2) Spinning, 3) Cross Fit, 4) Libre. 
 * Para ello, se debe leer y guardar el precio mensual de cada actividad. 
 * Adem�s, se debe leer para cada cliente: c�digo de cliente, DNI, apellido, nombre, fecha de nacimiento y 
 * el n�mero de actividad elegida (1..4). 
 * La lectura finaliza cuando llega el DNI 0. Se pide, informar para cada cliente, el monto a pagar. 
 * Se sabe que cada cliente elige una sola actividad. 
 * 
 * Modularizar su soluci�n.

}

{tipos de datos definidos por el usuario}
type
  cadena = string[50];
  rango_act = 1..4;
  rango_dias = 1..31;
  rango_meses = 1..12;
  rango_anios = 1900..3000;
  
  fecha = record
            d: rango_dias;
            m: rango_meses;
            a: rango_anios;
          end;   
  
  cliente = record
              codigo:integer;
              ape_nom: cadena;
              dni: real;
              fecha_nac: fecha;
              act: rango_act;
            end;  
            
   Precios_Act = record
                   P1: Real;
                   P2: Real;
                   P3: Real;
                   P4: Real;
                 end;    
					
{procesos y funciones}
procedure cargar_precios(var P:Precios_Act);
begin
with P do begin
  write('- Precio 1: ');
  readln(P1);
  write('- Precio 2: ');
  readln(P2);
  write('- Precio 3: ');
  readln(P3);
  write('- Precio 4: ');
  readln(P4);
end;  
end;

procedure leer_cliente(var c: cliente);
  procedure leer_fecha (var f:fecha);
    begin
     with f do begin
       write (' Dia: ');
       readln (d);
       write (' Mes: ');
       readln (m);
       write (' Anio: ');
       readln (a);
     end;  
    end;
begin
 with c do begin 
  write ('- DNI: ');
  readln (dni);
  if dni <> 0 then begin
               write ('- Codigo: ');
               readln (codigo);
               write('- Apellido y Nombre: ');
               readln(ape_nom);
               leer_fecha (fecha_nac);
               write('- Actividad elegida: ');
               readln(act);
              end;
 end;              
end;

  
    
{variables del programa principal}
var
  {datos de actividades}
  Precios: Precios_Act;
  
  {datos del cliente}
  cli: cliente;
  
begin
  writeln('-- DATOS DE LAS ACTIVIDADES --');
  writeln;
  cargar_precios(Precios);
  writeln;

  writeln('-- DATOS DE CLIENTES --');
  writeln;
  leer_cliente(cli);
  while (cli.dni <> 0) do begin
  writeln;
    CASE cli.act OF
      1: begin
          writeln('Cliente: ',cli.ape_nom, ' cuota mensual: ', precios.P1:3:0);
         end; 
      2: begin
          writeln('Cliente: ',cli.ape_nom, ' cuota mensual: ', precios.P2:3:0);
         end; 
      3: begin
          writeln('Cliente: ',cli.ape_nom, ' cuota mensual: ', precios.P3:3:0);
         end; 
      4: begin
          writeln('Cliente: ',cli.ape_nom, ' cuota mensual: ', precios.P4:3:0);
         end; 
      ELSE
        writeln('La actividad elegida no existe.');
    END;
    writeln;
    leer_cliente (cli ); 
  end;   
  writeln;
  writeln('-- Presione una tecla para finalizar --');
  readln;
end.
