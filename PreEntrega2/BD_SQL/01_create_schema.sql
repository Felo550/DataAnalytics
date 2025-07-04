-- 01_create_schema.sql
--------------------------------------------------------------------------------

-- 1) Crear base de datos si no existe
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'VideoGamesDB')
BEGIN
    CREATE DATABASE [VideoGamesDB];
END
GO

USE [VideoGamesDB];
GO

--------------------------------------------------------------------------------
-- 2) Tablas dimensión
--------------------------------------------------------------------------------

IF OBJECT_ID('dbo.Consoles', 'U') IS NOT NULL DROP TABLE dbo.Consoles;
CREATE TABLE dbo.Consoles (
    id_console    INT           NOT NULL PRIMARY KEY,
    name          NVARCHAR(100) NOT NULL,
    manufacturer  NVARCHAR(100) NULL,
    release_year  INT           NULL
);
GO

IF OBJECT_ID('dbo.Genres', 'U') IS NOT NULL DROP TABLE dbo.Genres;
CREATE TABLE dbo.Genres (
    id_genre      INT           NOT NULL PRIMARY KEY,
    genre_name    NVARCHAR(100) NOT NULL,
    description   NVARCHAR(MAX) NULL
);
GO

IF OBJECT_ID('dbo.Publishers', 'U') IS NOT NULL DROP TABLE dbo.Publishers;
CREATE TABLE dbo.Publishers (
    id_publisher  INT           NOT NULL PRIMARY KEY,
    name          NVARCHAR(255) NOT NULL
);
GO

IF OBJECT_ID('dbo.Developers', 'U') IS NOT NULL DROP TABLE dbo.Developers;
CREATE TABLE dbo.Developers (
    id_developer  INT           NOT NULL PRIMARY KEY,
    name          NVARCHAR(255) NOT NULL
);
GO

--------------------------------------------------------------------------------
-- 3) Tabla principal
--------------------------------------------------------------------------------

IF OBJECT_ID('dbo.VideoGames', 'U') IS NOT NULL DROP TABLE dbo.VideoGames;
CREATE TABLE dbo.VideoGames (
    id_videogame   INT            IDENTITY(1,1) NOT NULL PRIMARY KEY,
    img            NVARCHAR(MAX)  NULL,
    title          NVARCHAR(255)  NOT NULL,
    console_id     INT            NOT NULL,
    genre_id       INT            NOT NULL,
    publisher_id   INT            NOT NULL,
    developer_id   INT            NOT NULL,
    critic_score   NVARCHAR(50)   NOT NULL,
    release_date   DATE           NULL,
    last_update    DATETIME       NULL
);
GO

ALTER TABLE dbo.VideoGames ADD CONSTRAINT FK_VG_Consoles
FOREIGN KEY (console_id) REFERENCES dbo.Consoles(id_console);
ALTER TABLE dbo.VideoGames ADD CONSTRAINT FK_VG_Genres
FOREIGN KEY (genre_id) REFERENCES dbo.Genres(id_genre);
ALTER TABLE dbo.VideoGames ADD CONSTRAINT FK_VG_Publishers
FOREIGN KEY (publisher_id) REFERENCES dbo.Publishers(id_publisher);
ALTER TABLE dbo.VideoGames ADD CONSTRAINT FK_VG_Developers
FOREIGN KEY (developer_id) REFERENCES dbo.Developers(id_developer);
GO

--------------------------------------------------------------------------------
-- 4) Tabla de hechos
--------------------------------------------------------------------------------

IF OBJECT_ID('dbo.Sales', 'U') IS NOT NULL DROP TABLE dbo.Sales;
CREATE TABLE dbo.Sales (
    id_sale        INT            NOT NULL PRIMARY KEY,
    id_videogame   INT            NOT NULL,
    total_sales    MONEY          NULL,
    na_sales       MONEY          NULL,
    jp_sales       MONEY          NULL,
    pal_sales      MONEY          NULL,
    other_sales    MONEY          NULL
);
GO

ALTER TABLE dbo.Sales ADD CONSTRAINT FK_Sales_VG
FOREIGN KEY (id_videogame) REFERENCES dbo.VideoGames(id_videogame);
GO

--------------------------------------------------------------------------------
-- 5) Tabla de staging
--------------------------------------------------------------------------------

IF OBJECT_ID('dbo.videojuegos', 'U') IS NOT NULL DROP TABLE dbo.videojuegos;
CREATE TABLE dbo.videojuegos (
    id_videojuego  INT           NULL,
    img            NVARCHAR(4000) NULL,
    title          NVARCHAR(255) NULL,
    console        INT           NULL,
    genre          INT           NULL,
    publisher      INT           NULL,
    developer      INT           NULL,
    critic_score   VARCHAR(50)   NULL,
    release_date   VARCHAR(50)   NULL,
    last_update    VARCHAR(50)   NULL
);
GO
