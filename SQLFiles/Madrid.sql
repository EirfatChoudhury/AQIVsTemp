-- Create an empty Table with Year, PM10 levels as an indicator of Air Quality, and station_code
IF OBJECT_ID('dbo.MadridYearlyAQ', 'U') IS NOT NULL
DROP TABLE dbo.MadridYearlyAQ
GO
CREATE TABLE dbo.MadridYearlyAQ
(
    "YEAR" INT NOT NULL,
    PM10 FLOAT NOT NULL,
);
GO

INSERT INTO dbo.MadridYearlyAQ
(
    [YEAR],
    [PM10]
)
VALUES
(
    2001,
    (
        SELECT AVG("PM10") FROM madrid_2001
            WHERE 
                "station" = 28079001
                AND MONTH("date") = 8
                AND "PM10" IS NOT NULL
    )
)
GO

SELECT * FROM MadridYearlyAQ