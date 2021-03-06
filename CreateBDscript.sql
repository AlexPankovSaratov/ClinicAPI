USE [master]
GO
/****** Object:  Database [ClinicDataBase]    Script Date: 16.07.2021 16:59:11 ******/
CREATE DATABASE [ClinicDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClinicDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClinicDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClinicDataBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClinicDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClinicDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicDataBase] SET QUERY_STORE = OFF
GO
USE [ClinicDataBase]
GO
/****** Object:  Table [dbo].[Clinic_T]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic_T](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Clinic_T] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_T]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_T](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Patient_T] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientsByClinic]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientsByClinic](
	[ClinicID] [int] NOT NULL,
	[PatientID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddClinic]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddClinic]
	-- Add the parameters for the stored procedure here
	@Name as nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Clinic_T (Name) VALUES (@Name)
END
GO
/****** Object:  StoredProcedure [dbo].[AddPatient]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPatient]
	-- Add the parameters for the stored procedure here
	@Name as nvarchar(max),
	@City as nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Patient_T (Name, City) VALUES (@Name, @City)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPatientsByClinic]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPatientsByClinic]
	-- Add the parameters for the stored procedure here
	@ClinicName as nvarchar(max)
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pat.Id, pat.[Name], pat.City FROM 
	PatientsByClinic con
	LEFT JOIN Clinic_T cli
	ON con.ClinicID = cli.Id
	LEFT JOIN  Patient_T pat
	ON pat.Id = con.PatientID
	WHERE cli.Name = @ClinicName
END
GO
/****** Object:  StoredProcedure [dbo].[GetClinicByName]    Script Date: 16.07.2021 16:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClinicByName]
	-- Add the parameters for the stored procedure here
	@ClinicName as nvarchar(max)
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Id, [Name] FROM Clinic_T
	WHERE [Name] = @ClinicName
END
GO
USE [master]
GO
ALTER DATABASE [ClinicDataBase] SET  READ_WRITE 
GO
