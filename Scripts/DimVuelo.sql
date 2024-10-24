SELECT v.Id as 'IdVueloN', CONVERT(INT,REPLACE(v.["Flight_Number_Operating_Airline"],'"','')) as 'NumeroVuelo', a.Description as 'Aereolinea', REPLACE(v.["OriginCityName"],'"','') as 'Ciudad Origen', REPLACE(v.["DestState"],'"','') as 'Ciudad destino', CONVERT(INT,REPLACE(v.["FlightDate"],'-','')) as 'Fecha'
FROM Flights v
INNER JOIN Airlines a on REPLACE(v.["Operating_Airline "],'"','') = a.Code