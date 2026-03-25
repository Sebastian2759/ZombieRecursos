CREATE TABLE Zombies
(
	Id UNIQUEIDENTIFIER NOT NULL,
	Tipo NVARCHAR NOT NULL,
	TiempoDisparo INT NOT NULL,
	BalasNecesarias INT NOT NULL,
	NivelAmenaza INT NOT NULL,
	IsActive BIT NOT NULL,
	CreatedAtUtc DATETIME NOT NULL,
	UpdateAtUtc DATETIME NOT NULL

	constraint PK_Zombies PRIMARY KEY NONCLUSTERED (Id),

	CONSTRAINT CK_Zombies_TiempoDisparo CHECK(TiempoDisparo > 0),
	CONSTRAINT CK_Zombies_BalasNecesarias CHECK(BalasNecesarias > 0),
	CONSTRAINT CK_Zombies_NivelAmenza CHECK(NivelAmenaza > 0)
);

CREATE TABLE Usuarios(
Id UNIQUEIDENTIFIER NOT NULL,
Nombre NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
Rol NVARCHAR(50) NOT NULL,
PasswordHash NVARCHAR(500) NOT NULL,
	IsActive BIT NOT NULL,
	CreatedAtUtc DATETIME NOT NULL,
	UpdateAtUtc DATETIME NOT NULL

	CONSTRAINT PK_Usuarios PRIMARY KEY NONCLUSTERED(Id),
	CONSTRAINT UQ_Usuarios_Email UNIQUE(Email),
	CONSTRAINT CK_Usuario_Rol check(Rol IN('Admin','Defensor','Usuario'))
)

CREATE TABLE Simulaciones(
ID UNIQUEIDENTIFIER NOT NULL,
Fecha DATETIME NOT NULL,
Ubicacion NVARCHAR(100) NOT NULL,
TiempoDisponible  INT NOT NULL,
BalasDisponible INT NOT NULL,
	IsActive BIT NOT NULL,
	CreatedAtUtc DATETIME NOT NULL,
	UpdateAtUtc DATETIME NOT NULL,

	CONSTRAINT PK_Simulaciones PRIMARY KEY NONCLUSTERED(Id),
		CONSTRAINT CK_Simlaciones_TiempoDisponible CHECK(TiempoDisponible > 0),
	CONSTRAINT CK_Simulaciones_BalasDisponibles CHECK(BalasDisponible > 0)

);


CREATE TABLE Defenses(
Id UNIQUEIDENTIFIER NOT NULL,
UsuarioId UNIQUEIDENTIFIER NOT NULL,
SimulacionID UNIQUEIDENTIFIER NOT NULL,
PuntosObtenidos INT NOT NULL,
Timestamp DATETIME NOT NULL,
	IsActive BIT NOT NULL,
	CreatedAtUtc DATETIME NOT NULL,
	UpdateAtUtc DATETIME NOT NULL,

	CONSTRAINT Pk_Defenses PRIMARY KEY NONCLUSTERED(Id),
	CONSTRAINT FK_Defenses_Usuario
	FOREIGN KEY (UsuarioId)
	REFERENCES dbo.Usuarios (Id)
	ON DELETE NO ACTION,

	CONSTRAINT FK_Defenses_Simulaciones
	FOREIGN KEY(UsuarioId)
	REFERENCES dbo.Usuarios(Id)
	ON DELETE NO ACTION,

	CONSTRAINT CK_Defenses_PuntosObtenidos CHECK(PuntosObtenidos > 0)
)


CREATE TABLE ELIMINADOS(
Id UNIQUEIDENTIFIER NOT NULL,
DefenzaId uniqueidentifier NOT NULL,
ZombieId UNIQUEIDENTIFIER NOT NULL,
PuntosObtenidos INT NOT NULL,
EliminadoEn datetime not null,
	IsActive BIT NOT NULL,
	CreatedAtUtc DATETIME NOT NULL,
	UpdateAtUtc DATETIME NOT NULL,

	CONSTRAINT PK_Eliminados PRIMARY KEY NONCLUSTERED(Id),
	CONSTRAINT FK_Eliminados_Defensas
	FOREIGN KEY (DefenzaId)
	REFERENCES Defenses(Id)
	ON DELETE CASCADE,

);

CREATE TABLE AuditLog(
Id UNIQUEIDENTIFIER NOT NULL,
EntidadNombre VARCHAR(50) NOT NULL,
EntidadId UNIQUEIDENTIFIER NOT NULL,
TipoAccion Nvarchar(50) NOT NULL,
FechaAccion DATETIME NOT NULL,
ValoresAnteriores NVARCHAR(500) NOT NULL,
ValoresNuevos NVARCHAR(500) NOT NULL,

constraint PK_AuditLog PRIMARY KEY NONCLUSTERED(Id),
CONSTRAINT CK_Auditlog_TipoAccion CHECK(TipoAccion IN('Added','Modified','Deleted'))
)