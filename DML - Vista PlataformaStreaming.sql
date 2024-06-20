CREATE VIEW VistaGlobal AS
SELECT 
    u.UsuarioID,
    u.Nombre,
    u.Email,
    u.FechaRegistro,
    s.SuscripcionID,
    s.FechaInicio AS FechaInicioSuscripcion,
    s.FechaFin AS FechaFinSuscripcion,
    s.Tipo AS TipoSuscripcion,
    hv.HistorialID,
    hv.FechaVisualizacion,
    p.PeliculaID,
    p.Titulo AS TituloPelicula,
    p.Genero AS GeneroPelicula,
    p.FechaEstreno AS FechaEstrenoPelicula
FROM 
    Usuarios u
LEFT JOIN 
    Suscripciones s ON u.UsuarioID = s.UsuarioID
LEFT JOIN 
    HistorialVisualizacion hv ON u.UsuarioID = hv.UsuarioID
LEFT JOIN 
    Peliculas p ON hv.PeliculaID = p.PeliculaID;
