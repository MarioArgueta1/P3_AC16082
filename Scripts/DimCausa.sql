SELECT MIN(v.Id) as 'IdCausaN', CONVERT(FLOAT,v.["WeatherDelay"]) as 'RetrasoClima', CONVERT(FLOAT,v.["CarrierDelay"]) as 'RestrasoProveedor', CONVERT(FLOAT,v.["SecurityDelay"]) as 'RetrasoSeguridad', CONVERT(FLOAT,v.["NASDelay"]) as 'RetrasoSistemaNacionalAviacion', CONVERT(FLOAT,v.["LateAircraftDelay"]) as 'RetrasoAereonave',
COALESCE(
(ISNULL(CASE 
WHEN CONVERT(FLOAT,v.["WeatherDelay"]) > 0 THEN 'Clima,'
END, '') +
ISNULL(CASE
WHEN CONVERT(FLOAT,v.["CarrierDelay"]) > 0 THEN 'Proveedor,'
END, '') +
ISNULL(
CASE
WHEN CONVERT(FLOAT,v.["SecurityDelay"]) > 0 THEN 'Seguridad,'
END, '') +
ISNULL(
CASE
WHEN CONVERT(FLOAT,v.["NASDelay"]) > 0 THEN 'SistemaNacionalAviacion,'
END, '') +
ISNULL(
CASE
WHEN CONVERT(FLOAT,v.["LateAircraftDelay"]) > 0 THEN 'Aereonave'
END, '')
), 'Sin especificar' ) as 'Motivo',
v.["CancellationCode"] as 'CodigoCancelacion', 
CONVERT(INT,v.["Cancelled"]) as 'IndicadorCancelacion',
CASE CONVERT(INT,v.["Cancelled"])
WHEN 1 THEN 'Si'
ELSE 'No'
END as 'Cancelado'
FROM Flights v
GROUP BY 
    CONVERT(FLOAT,v.["WeatherDelay"]), 
    CONVERT(FLOAT,v.["CarrierDelay"]), 
    CONVERT(FLOAT,v.["SecurityDelay"]),
    CONVERT(FLOAT,v.["NASDelay"]),
    CONVERT(FLOAT,v.["LateAircraftDelay"]),
    v.["CancellationCode"],
    CONVERT(INT,v.["Cancelled"])