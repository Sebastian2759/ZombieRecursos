-- ============================================================
--  SEED DATA - Zombie Defense DB
--  PasswordHash: BCrypt $2b$ cost=12
-- ============================================================
SET NOCOUNT ON;
GO

BEGIN TRANSACTION;
BEGIN TRY

-- ============================================================
-- 1. ZOMBIES
-- ============================================================
INSERT INTO dbo.Zombies (Id, Tipo, TiempoDisparo, BalasNecesarias, NivelAmenaza, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('6062D06F-5440-46F1-BA62-7E33495A2C57',  N'Walker',  5,  3,  1, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Zombies (Id, Tipo, TiempoDisparo, BalasNecesarias, NivelAmenaza, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('C5D61A5D-C261-4A86-8775-6CA0613BA0A3',  N'Runner',  2,  5,  2, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Zombies (Id, Tipo, TiempoDisparo, BalasNecesarias, NivelAmenaza, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('73BE5546-DD69-40DE-9079-8D7E3C3B1085',    N'Tank',    8,  15, 4, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Zombies (Id, Tipo, TiempoDisparo, BalasNecesarias, NivelAmenaza, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('6BCD5993-742A-4C02-B090-612AD3649687', N'Spitter', 4,  7,  3, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Zombies (Id, Tipo, TiempoDisparo, BalasNecesarias, NivelAmenaza, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('C10C742D-EEF4-4082-8620-ECDBBEEB8679',   N'Brute',   6,  12, 5, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- ============================================================
-- 2. USUARIOS  (PasswordHash: BCrypt $2b$ cost=12)
-- ============================================================
-- admin / Admin@123
INSERT INTO dbo.Usuarios (Id, Nombre, Email, Rol, PasswordHash, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('B208FEB0-51D1-4156-A4BE-4B42E6B70652', N'Carlos Administrador', N'admin@zombiedefense.com', N'Admin',
        N'$2b$12$oj72GETKWhFWrzCyx8ucf.lySH9GMr48bbtC4pyB5dfcIyh3HEuwq', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- Maria / Maria@456
INSERT INTO dbo.Usuarios (Id, Nombre, Email, Rol, PasswordHash, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('EBECF307-8E61-4578-B30C-7E6C709C293C', N'Maria Defensora', N'maria@zombiedefense.com', N'Defensor',
        N'$2b$12$ddMJcBWn8rJg5/FLnXN4ze3t22m9ET54DxMuVu7BZCq0g87MHk/ja', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- Juan / Juan@789
INSERT INTO dbo.Usuarios (Id, Nombre, Email, Rol, PasswordHash, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('DB259805-82A3-4A1A-8254-BA7C5DA3F1BB', N'Juan Defensor', N'juan@zombiedefense.com', N'Defensor',
        N'$2b$12$WBjKKSGFeFuAdRjruiqW0eFl2xItRo6wNcN/3ectjPhUuK1f9DniW', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- Ana / Ana@2024
INSERT INTO dbo.Usuarios (Id, Nombre, Email, Rol, PasswordHash, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('E70DA5BD-E406-41C8-A702-47D585CA149E', N'Ana Usuaria', N'ana@zombiedefense.com', N'Usuario',
        N'$2b$12$o7XMgGMZF6hUubo86lV7DefXYQca/vo0UR1LPmM4VKykNx5RsZMn.', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- ============================================================
-- 3. SIMULACIONES
-- ============================================================
INSERT INTO dbo.Simulaciones (Id, Fecha, Ubicacion, TiempoDisponible, BalasDisponible, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('C2258DAF-9AC6-470D-9FD2-83666081F242', '2024-03-10 08:00:00', N'Sector Norte - Zona A',    120, 500, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Simulaciones (Id, Fecha, Ubicacion, TiempoDisponible, BalasDisponible, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('6B76019A-8184-4F0D-9F5A-C0CADB209B5C', '2024-03-15 14:00:00', N'Sector Sur - Zona B',      90,  350, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Simulaciones (Id, Fecha, Ubicacion, TiempoDisponible, BalasDisponible, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('17681DAE-BCA9-4B66-A3E3-E71EB2136910', '2024-03-20 10:30:00', N'Sector Centro - Bunker 7', 180, 800, 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- ============================================================
-- 4. DEFENSES
-- ============================================================
INSERT INTO dbo.Defenses (Id, UsuarioId, SimulacionID, PuntosObtenidos, Timestamp, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('80A78016-6095-490F-87DA-27B82CE974FE', 'EBECF307-8E61-4578-B30C-7E6C709C293C', 'C2258DAF-9AC6-470D-9FD2-83666081F242', 1500, '2024-03-10 09:45:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Defenses (Id, UsuarioId, SimulacionID, PuntosObtenidos, Timestamp, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('2F73E0BC-59A2-4644-94C6-5EE788194E32', 'DB259805-82A3-4A1A-8254-BA7C5DA3F1BB', '6B76019A-8184-4F0D-9F5A-C0CADB209B5C', 980,  '2024-03-15 15:30:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.Defenses (Id, UsuarioId, SimulacionID, PuntosObtenidos, Timestamp, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('5CA8F38B-151A-4C19-9CE6-E1F5E00BB60A', 'EBECF307-8E61-4578-B30C-7E6C709C293C', '17681DAE-BCA9-4B66-A3E3-E71EB2136910', 2200, '2024-03-20 12:00:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- ============================================================
-- 5. ELIMINADOS
-- ============================================================
INSERT INTO dbo.ELIMINADOS (Id, DefenzaId, ZombieId, PuntosObtenidos, EliminadoEn, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('3E9964DB-D197-442F-8798-E48C97799F66', '80A78016-6095-490F-87DA-27B82CE974FE', '6062D06F-5440-46F1-BA62-7E33495A2C57',  300,  '2024-03-10 09:10:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.ELIMINADOS (Id, DefenzaId, ZombieId, PuntosObtenidos, EliminadoEn, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('508CC95E-BEFF-4BA3-B21D-97528C3FAD83', '80A78016-6095-490F-87DA-27B82CE974FE', 'C5D61A5D-C261-4A86-8775-6CA0613BA0A3',  500,  '2024-03-10 09:25:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.ELIMINADOS (Id, DefenzaId, ZombieId, PuntosObtenidos, EliminadoEn, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('107B24A8-D851-4963-A430-CDC9905BD5D8', '80A78016-6095-490F-87DA-27B82CE974FE', '6BCD5993-742A-4C02-B090-612AD3649687', 700,  '2024-03-10 09:40:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.ELIMINADOS (Id, DefenzaId, ZombieId, PuntosObtenidos, EliminadoEn, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('CE6BBFE8-C474-4D5E-9064-B5FF5AED90E0', '2F73E0BC-59A2-4644-94C6-5EE788194E32', '6062D06F-5440-46F1-BA62-7E33495A2C57',  300,  '2024-03-15 15:00:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.ELIMINADOS (Id, DefenzaId, ZombieId, PuntosObtenidos, EliminadoEn, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('5D5AA563-49CB-4CF9-82D8-A2D7CE1C99F3', '2F73E0BC-59A2-4644-94C6-5EE788194E32', '73BE5546-DD69-40DE-9079-8D7E3C3B1085',    680,  '2024-03-15 15:20:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

INSERT INTO dbo.ELIMINADOS (Id, DefenzaId, ZombieId, PuntosObtenidos, EliminadoEn, IsActive, CreatedAtUtc, UpdateAtUtc)
VALUES ('66FCD8ED-CD75-4B03-8319-7496066E7421', '5CA8F38B-151A-4C19-9CE6-E1F5E00BB60A', 'C10C742D-EEF4-4082-8620-ECDBBEEB8679',   1100, '2024-03-20 11:50:00', 1, '2024-03-01 10:00:00', '2024-03-01 10:00:00');

-- ============================================================
-- 6. AUDITLOG
-- ============================================================
INSERT INTO dbo.AuditLog (Id, EntidadNombre, EntidadId, TipoAccion, FechaAccion, ValoresAnteriores, ValoresNuevos)
VALUES ('90DFBA0F-0389-4585-AF4C-D59608EA9973', 'Usuarios',     'B208FEB0-51D1-4156-A4BE-4B42E6B70652',  N'Added',    '2024-03-01 07:00:00', N'{}', N'{"Nombre":"Carlos Administrador","Rol":"Admin"}');

INSERT INTO dbo.AuditLog (Id, EntidadNombre, EntidadId, TipoAccion, FechaAccion, ValoresAnteriores, ValoresNuevos)
VALUES ('C71EB2DF-3F49-4173-86DF-1DF84A9C9370', 'Usuarios',     'EBECF307-8E61-4578-B30C-7E6C709C293C',   N'Added',    '2024-03-01 07:05:00', N'{}', N'{"Nombre":"Maria Defensora","Rol":"Defensor"}');

INSERT INTO dbo.AuditLog (Id, EntidadNombre, EntidadId, TipoAccion, FechaAccion, ValoresAnteriores, ValoresNuevos)
VALUES ('B7582A09-5829-4A61-AC01-59ECA85188D0', 'Zombies',      '6062D06F-5440-46F1-BA62-7E33495A2C57', N'Added',    '2024-03-01 08:00:00', N'{}', N'{"Tipo":"Walker","NivelAmenaza":1}');

INSERT INTO dbo.AuditLog (Id, EntidadNombre, EntidadId, TipoAccion, FechaAccion, ValoresAnteriores, ValoresNuevos)
VALUES ('367742FA-7002-4FD4-964A-465093749F03', 'Simulaciones', 'C2258DAF-9AC6-470D-9FD2-83666081F242',   N'Added',    '2024-03-10 07:55:00', N'{}', N'{"Ubicacion":"Sector Norte - Zona A","BalasDisponible":500}');

INSERT INTO dbo.AuditLog (Id, EntidadNombre, EntidadId, TipoAccion, FechaAccion, ValoresAnteriores, ValoresNuevos)
VALUES ('349AB046-0274-40B8-AD86-3D830F4085C2', 'Defenses',     '80A78016-6095-490F-87DA-27B82CE974FE',   N'Added',    '2024-03-10 09:45:00', N'{}', N'{"PuntosObtenidos":1500}');

INSERT INTO dbo.AuditLog (Id, EntidadNombre, EntidadId, TipoAccion, FechaAccion, ValoresAnteriores, ValoresNuevos)
VALUES ('A5674631-C222-4BC1-BDAA-FD04356D3D49', 'Defenses',     '2F73E0BC-59A2-4644-94C6-5EE788194E32',   N'Modified', '2024-03-15 16:00:00', N'{"PuntosObtenidos":900}', N'{"PuntosObtenidos":980}');

    COMMIT TRANSACTION;
    PRINT 'Seed data insertado correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'ERROR: ' + ERROR_MESSAGE();
    THROW;
END CATCH;