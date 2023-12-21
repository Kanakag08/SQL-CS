create database VirtualArtGallery;
use VirtualArtGallery;

--create table artwork
create table ArtWork
(
ArtworkID int primary key,
Title varchar(100),
Description text,
CreationDate date,
Medium varchar(50),
ImageURL Varchar(50),
);

INSERT INTO Artwork (ArtworkID, Title, ArtistID, CategoryID, Year, Description,ImageURL)
VALUES
 (1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.','starry_night.jpg'),
 (2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.','mona_lisa.jpg'),
  (3, 'Guernica', 1, 1, 1937, 'Pablo Picassos powerful anti-war mural.','guernica.jpg');

--create table artist
create table Artist
(
ArtistID int primary key,
Name varchar(50),
Biography text,
BirthDate date,
Nationality varchar(50),
website varchar(50),
ContactInfo int
);

INSERT INTO Artist (ArtistID, Name, Biography, Nationality) VALUES
 (1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
 (2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
 (3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');

--create table Category
create table Category
(
CategoryID int primary key,
Name varchar(50),
);

INSERT INTO Category (CategoryID, Name) VALUES
 (1, 'Painting'),
 (2, 'Sculpture'),
 (3, 'Photography');

--create table Exhibition
create table Exhibitions
(
ExhibitionID int primary key,
Title Varchar(50),
EndDate date,
Description varchar(50)
);

Alter Table Exhibitions
Add StartDate date;

INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description)
VALUES
 (1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
 (2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');


--create table exhibition artwork
create table ExhibtionArtworks
(
ExhibitionID int foreign key
references Exhibitions(ExhibitionID),
ArtworkId int foreign key 
references Artwork(ArtworkID)
);
INSERT INTO ExhibtionArtworks(ExhibitionID, ArtworkID) VALUES
 (1, 1),
 (1, 2),
 (1, 3),
 (2, 2);

