CREATE TABLE driverStat(
id_stat numeric primary key identity (1,1),
opis text,
vreme datetime
);

-------------------TRIGGER----------------------------

GO
CREATE TRIGGER A_4 ON dbo.Bus
AFTER INSERT 
AS
BEGIN
DECLARE @id_vehicle NUMERIC
SELECT @id_vehicle = dbo.Bus.vehicle FROM INSERTED
DECLARE @id_schedule NUMERIC
SELECT @id_schedule = dbo.Bus.Scheduleid FROM INSERTED
INSERT INTO driverStat(opis, vreme)
VALUES('A new vehicle has been inserted with ID ' + @id_vehicle + ' and schedule ID ' + @id_schedule, GETDATE());
END

-------------------BONUS TRIGGER??----------------------------

GO
CREATE TRIGGER A_4 ON dbo.Bus AS B
INNER JOIN Schedule AS S
ON B.ScheduleId = S.id
INNER JOIN  Route AS R
ON S.RouteId = R.id
AFTER INSERT 
AS
BEGIN
DECLARE 
DECLARE @id_vehicle NUMERIC
SELECT @id_vehicle = dbo.Bus.vehicle FROM INSERTED
DECLARE @id_route NUMERIC
SELECT @id_route = dbo.Route.id FROM INSERTED
INSERT INTO driverStat(opis, vreme)
VALUES('A new vehicle has been inserted with ID ' + @id_vehicle + ' and schedule ID ' + @id_route, GETDATE());
END
-------------------PROCEDURE----------------------------
GO
CREATE PROCEDURE A_5 @vehicle_id NUMERIC
AS
SELECT stopid, arrival, vehicle
FROM BUS AS B INNER JOIN SCHEDULE AS S
ON B.vehicle=S.id
INNER JOIN ROUTE AS R
ON R.id=S.RouteId
INNER JOIN RouteStop AS RS
ON R.id=RS.RouteId
WHERE vehicle = @vehicle_id
GO

EXEC A_5 2
-------------------VIEW----------------------------
GO
CREATE VIEW A_7 
AS
SELECT S.name, S.Terminus, S.id, R.id 
FROM Stop AS S INNER JOIN RouteStop AS RS
ON S.id = RS.Stopid
INNER JOIN ROUTE AS R
ON R.id = RS.Routeid


-------------------FUNCTION-----------------------
CREATE FUNCTION dbo.numDays
(
    @date DATETIME
)
RETURNS INT
AS
BEGIN
    SET @date = GETDATE()

    SELECT DAY(EOMONTH(@ADate)) AS DaysInMonth

    RETURN DAY(DATEADD(DD,-1,DATEADD(MM,DATEDIFF(MM,-1,@date),0)))

END
GO