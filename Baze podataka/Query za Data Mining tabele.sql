USE PredskolskaUstanova
GO

--Kreiranje nove tabele DataMiningUkupnoUpisano na osnovu query-a za potrebe Data Mining-a u projektu
SELECT YEAR(DatumUpisa) AS Godina,COUNT(DijeteID) AS BrojUpisanih
INTO DataMiningUkupnoUpisano
FROM Dijete
GROUP BY YEAR(DatumUpisa)
ORDER BY Godina
GO

--Kreiranje nove tabele DataMiningUkupnoUpisano2 na osnovu query-a za potrebe Data Mining-a u projektu

SELECT DatumUpisa,YEAR(DatumUpisa) AS Godina,MONTH(DatumUpisa) AS Mjesec,COUNT(DijeteID) AS BrojUpisanih
INTO DataMiningUkupnoUpisano2
FROM Dijete 
GROUP BY DatumUpisa,YEAR(DatumUpisa),MONTH(DatumUpisa)
ORDER BY DatumUpisa,Godina,Mjesec


--Kreiranje nove tabele DataMiningUplateIsplateProfit na osnovu query-a za potrebe Data Mining-a u projektu
SELECT  CONVERT(INT,CONVERT(NVARCHAR,YEAR(DatumIsplate))+CONVERT(NVARCHAR,MONTH(DatumIsplate))) AS GodinaMjesec,
         (SELECT SUM(RU.Iznos)
		 FROM RoditeljUplate AS RU
		 WHERE YEAR(RU.Datum)=YEAR(DatumIsplate) AND MONTH(RU.Datum)=MONTH(DatumIsplate)
		 )-SUM(Iznos) Iznos
INTO DataMiningUplateIsplateProfit
FROM Plata
GROUP BY YEAR(DatumIsplate),MONTH(DatumIsplate)
ORDER BY YEAR(DatumIsplate),MONTH(DatumIsplate)
GO



