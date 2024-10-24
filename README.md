# P3_AC16082
El modelo consta de 4 dimensiones: DimVuelo, DimAereopuerto, DimCausa, DimTiempo
ademas de la tabla de hechos: DimEstadoVuelo

Se utilizo el dataset: https://www.kaggle.com/datasets/robikscube/flight-delay-dataset-20182022/data para la raw data
ademas se utilizo el dataset: https://www.kaggle.com/datasets/tylerx/flights-and-airports-data para la data de los aereopuertos

A continuacion se muestra el mapeo utilizado de los datasets y el modelo dimensional construido:

DimVuelo

IdVuelo -> Llave autogenerada <br />
IdVueloN -> Llave de negocio proveniente de tabla flights (campo id) <br />
NumeroVuelo -> Flight_Number_Operating_Airline de tabla flights <br />
Aereolinea -> Description de tabla Airlines <br />
Ciudad origen -> OriginCityName de tabla flights <br />
Ciudad destino -> DestState de tabla flights <br />
Fecha -> FlightDate de tabla flights <br />

DimAereopuerto

IdAereopuerto -> Llave autogenerada <br />
IdAereopuertoN -> Llave de negocio proveniente de tabla flights (campo id) <br />
IdOrigenAereopuerto -> OriginAirportID de tabla flights <br />
IdDestinoAereopuerto -> DestAirportSeqID de tabla flights <br />
NombreAereopuertoOrigen -> name de tabla Airports <br />
NombreAereopuertoDestino -> name de tabla Airports <br />

DimCausa

IdCausa -> Llave autogenerada <br />
IdCausaN -> Llave de negocio proveniente de tabla flights (campo id) <br />
RetrasoClima -> WeatherDelay de tabla flights <br />
RetrasoProveedor -> CarrierDelay de tabla flights <br />
RetrasoSeguridad -> SecurityDelay de tabla flights <br />
RetrasoSistemaNacionalAviacion -> NASDelay de tabla flights <br />
RetrasoAereonave -> LateAircraftDelay de tabla flights <br />
Motivo -> Regla ETL (se evalua cuales valores de retraso son diferentes de 0 y se concatena texto de motivo, ejemplo: Clima o si son varios: Clima,Segurida,...) de tabla flights <br />
CodigoCancelacion -> CancellationCode de tabla flights <br />
IndicadorCancelacion -> Cancelled de tabla flights <br />
Cancelado -> Regla ETL (se evalua si el campo Cancelled es igual a 1 (indicador de vuelo cancelado segun descripcion del dataset utilizado)) se procede a colocar el texto "Si" o "No" <br />

FactEstadoVuelo

IdVuelo -> llave de DimVuelo <br />
IdCausa -> llave de DimCausa <br />
IdTiempo -> llave de DimTiempo <br />
IdAereopuerto -> llave de DimAereopuerto <br />
MinutosRetrasoSalida -> DepDelayMinutes de tabla flights <br />
MinutosRetrasoLlegada -> ArrDelayMinutes de tabla flights <br />
CantidadVuelos -> Flights de tabla flights <br />
DistanciaRecorrida -> Distance de tabla flights <br />

ETL

* Se construyo un ETL para cargar la raw data en una tabla llamada Flights, este etl lee y carga los 55 elementos de los archivos csv de Flights para los 5 años, ademas de leer y cargar los datos de Airlines y Airports en sus respectivas tablas <br />

* Se construyo un ETL para el llenado de cada dimension utilizando los scripts de la carpeta Scripts, ademas el ETL para el llenado de la tabla de hechos <br />

* Se construyo un ETL Principal, el cual como primera instruccion tiene el borrado (en caso de existir) de las dimensiones, para posteriormente crear las dimensiones y ejecutar los paquetes de cada dimension y tabla de hechos para el llenado de la data <br />

* Para el caso de la DimTiempo, se utiliza la tabla auxiliar Date_Dimension, la cual se debe correr por separado una sola vez usando el script de creacion de la tabla y posteriormente ejecutar el script de insercion de la data para esta tabla auxiliar, para asi el ETL principal llenar la dimension de tiempo <br />