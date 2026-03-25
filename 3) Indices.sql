-- creacion de indices

CREATE NONCLUSTERED INDEX IX_Zombies_IsActive
ON Zombies(IsActive)
INCLUDE (Tipo,TiempoDisparo, BalasNecesarias, NivelAmenaza)


CREATE NONCLUSTERED INDEX IX_Usuarios_Email
ON Usuarios(Email)
INCLUDE (Id,Nombre,Rol,PasswordHash,IsActive)


CREATE NONCLUSTERED INDEX IX_Simulacion_Fecha
ON Simulaciones (Fecha DESC)
include(Id, Ubicacion, TiempoDisponible, BalasDisponible,IsActive)