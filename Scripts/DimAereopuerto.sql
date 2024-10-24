SELECT 
    MIN(v.Id) AS 'IdAereopuertoN', 
    CONVERT(INT, v.["OriginAirportID"]) AS 'IdOrigenAereopuerto', 
    CONVERT(INT, v.["DestAirportSeqID"]) AS 'IdDestinoAereopuerto', 
    COALESCE(ao.name,'Sin determinar') AS 'NombreAereopuertoOrigen', 
    COALESCE(ad.name, 'Sin determinar') AS 'NombreAereopuertoDestino'
FROM Flights v
LEFT JOIN Airports ao ON ao.airport_id = v.["OriginAirportID"]
LEFT JOIN Airports ad ON ad.airport_id = v.["DestAirportSeqID"]
GROUP BY 
    CONVERT(INT, v.["OriginAirportID"]), 
    CONVERT(INT, v.["DestAirportSeqID"]), 
    ao.name, 
    ad.name
