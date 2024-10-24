SELECT v1.IDVUELO as 'IdVuelo',
       dc.IDCAUSA as 'IdCausa',
       v3.IDTIEMPO as 'IdTiempo',
       da.IDAEREOPUERTO as 'IdAereopuerto',
       CONVERT(INT, REPLACE(v.["DepDelayMinutes"], '"', '')) as 'MinutosRetrasoSalida',
       CONVERT(INT, REPLACE(v.["ArrDelayMinutes"], '"', '')) as 'MinutosRetrasoLlegada',
       CONVERT(FLOAT, v.["Flights"]) as 'CantidadVuelos',
       CONVERT(FLOAT, v.["Distance"]) as 'DistanciaRecorrida'
FROM Flights v
INNER JOIN DIMVUELO v1 ON v1.IDVUELO = v.Id
INNER JOIN DIMTIEMPO v3 ON v3.IDTIEMPO = v1.FECHA
INNER JOIN DIMCAUSA dc 
       ON dc.RETRASOCLIMA = CONVERT(FLOAT, v.["WeatherDelay"]) 
       AND dc.RETRASOPROVEEDOR = CONVERT(FLOAT, v.["CarrierDelay"])
       AND dc.RETRASOSEGURIDAD = CONVERT(FLOAT, v.["SecurityDelay"])
       AND dc.RETRASOSISTEMANACIONALAVIACION = CONVERT(FLOAT, v.["NASDelay"])
       AND dc.RETRASOAEREONAVE = CONVERT(FLOAT, v.["LateAircraftDelay"])
       AND dc.CODIGOCANCELACION = v.["CancellationCode"]
       AND dc.INDICADORCANCELACION = CONVERT(INT, v.["Cancelled"])
INNER JOIN DIMAEREOPUERTO da 
       ON CONVERT(INT, v.["OriginAirportID"]) = da.IDORIGENAEREOPUERTO
       AND CONVERT(INT, v.["DestAirportSeqID"]) = da.IDDESTINOAEREOPUERTO
