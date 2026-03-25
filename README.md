# ZombieRecursos

Scripts SQL para la base de datos **ZombiesDefense** de la aplicación Zombie Defense.

## Repositorios del proyecto

| Repositorio | Descripción | URL |
|---|---|---|
| **ZombieFronted** | Frontend Angular 19 | https://github.com/Sebastian2759/ZombieFronted- |
| **ZombieBacked** | Backend .NET 10 | https://github.com/Sebastian2759/ZombieBacked |
| **ZombieRecursos** | Scripts SQL | https://github.com/Sebastian2759/ZombieRecursos |

## Ambiente de base de datos

### Local (Development)
| Campo | Valor |
|---|---|
| Server | `LORE\SQLEXPRESS` |
| Base de datos | `ZombiesDefense` |
| Autenticación | Windows Authentication |

### Producción (Azure)
| Campo | Valor |
|---|---|
| Server | `zombie-sql-srv-2026.database.windows.net,1433` |
| Base de datos | `ZombiesDefense` |
| Usuario | `sqladmin` |
| Tier | Azure SQL Serverless (Gen5, 2 vCores) |
| Resource Group | `zombie-defense-rg` (West US 3) |

## Scripts — orden de ejecución

| Orden | Archivo | Descripción |
|---|---|---|
| 1 | `1)CreacionBd.sql` | Crea la base de datos `ZombiesDefense` si no existe |
| 2 | `2) Creacion Tablas.sql` | Crea las 6 tablas con sus constraints y FK |
| 3 | `3) Indices.sql` | Crea índices no agrupados para optimizar consultas |
| 4 | `4) Inserts.sql` | Inserta datos de prueba (seed data) |

## Tablas

| Tabla | Descripción |
|---|---|
| `Zombies` | Tipos de zombies con nivel de amenaza y balas necesarias |
| `Usuarios` | Usuarios del sistema con roles (Admin, Defensor, Usuario) |
| `Simulaciones` | Escenarios de simulación con balas y tiempo disponible |
| `Defenses` | Registro de defensas ejecutadas por usuarios |
| `ELIMINADOS` | Zombies eliminados en cada defensa |
| `AuditLog` | Auditoría de cambios (Added, Modified, Deleted) |

## Cómo ejecutar los scripts

### Desde SSMS
1. Conectarse al servidor
2. Ejecutar los scripts en orden del 1 al 4

### Desde línea de comandos (sqlcmd)
```bash
sqlcmd -S <servidor> -U <usuario> -P <password> -i "1)CreacionBd.sql"
sqlcmd -S <servidor> -U <usuario> -P <password> -d ZombiesDefense -i "2) Creacion Tablas.sql"
sqlcmd -S <servidor> -U <usuario> -P <password> -d ZombiesDefense -i "3) Indices.sql"
sqlcmd -S <servidor> -U <usuario> -P <password> -d ZombiesDefense -i "4) Inserts.sql"
```

## Usuarios de prueba (seed data)

| Email | Password | Rol |
|---|---|---|
| admin@zombiedefense.com | Admin@123 | Admin |
| maria@zombiedefense.com | Maria@456 | Defensor |
| juan@zombiedefense.com | Juan@789 | Defensor |
| ana@zombiedefense.com | Ana@2024 | Usuario |
