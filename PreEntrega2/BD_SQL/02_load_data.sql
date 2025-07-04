USE VideoGamesDB;
GO

-- 1) Consoles
BULK INSERT dbo.Consoles
FROM 'C:\CargaSQL\videogames\consolas.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',  -- ← corregido aquí
  ROWTERMINATOR = '\r\n', -- para Windows
  CODEPAGE = '65001'
);
GO
/*
-- 2) Genres
BULK INSERT dbo.Genres
FROM 'C:\CargaSQL\videogames\generos.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);
GO

-- 3) Publishers
BULK INSERT dbo.Publishers
FROM 'C:\CargaSQL\videogames\publishers.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);
GO

-- 4) Developers
BULK INSERT dbo.Developers
FROM 'C:\CargaSQL\videogames\developers.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);
GO

-- 5) VideoGames
BULK INSERT dbo.VideoGames
FROM 'C:\CargaSQL\videogames\videojuegos.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);
GO

-- 6) Sales
BULK INSERT dbo.Sales
FROM 'C:\CargaSQL\videogames\ventas.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);
GO
*/