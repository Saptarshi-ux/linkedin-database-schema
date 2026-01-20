create database linkedin_db_new;
use linkedin_db_new;
create table Users (
		UserID int auto_increment primary key,
		FirstName varchar(50),
		LastName varchar(50),
		Email varchar(100) unique,
		Password varchar(255),
		Headline varchar(255),
		Summary text,
		Location varchar(100),
		ProfilePicture varchar(255)
);
create table Connections (
		ConnectionID int auto_increment primary key,
		UserID1 int,
		UserID2 int,
		Status enum('Pending', 'Accepted'),
		ConnectionDate DATE,
		foreign key (UserID1) references Users(UserID),
		foreign key (UserID2) references Users(UserID)
);
create table Posts (
		PostID int auto_increment primary key,
		UserID int,
		Content text,
		PostDate date,
		Visibility enum('Public', 'Connections'),
		foreign key (UserID) references Users(UserID)
);
create table Comments (
		CommentID int auto_increment primary key,
		PostID int,
		UserID int,
		Content text,
		CommentDate date,
		foreign key (PostID) references Posts(PostID),
		foreign key (UserID) references Users(UserID)
);
create table Likes (
		LikeID int auto_increment primary key,
		PostID int,
		UserID int,
		LikeDate date,
		foreign key (PostID) references Posts(PostID),
		foreign key (UserID) references Users(UserID)
);
create table Messages (
		MessageID int auto_increment primary key,
		SenderID int,
		ReceiverID int,
		Content text,
		SentDate date,
		IsRead boolean,
		foreign key (SenderID) references Users(UserID),
		foreign key (ReceiverID) references Users(UserID)
);
create table Skills (
		SkillID int auto_increment primary key,
		SkillName varchar(100)
);

create table UserSkills (
		UserID int,
		SkillID int,
		primary key (UserID, SkillID),
		Foreign key (UserID) references Users(UserID),
		foreign key (SkillID) references Skills(SkillID)
);
create table EducationRecords (
		EducationID int auto_increment primary key,
		UserID int,
		SchoolName varchar(255),
		Degree varchar(100),
		FieldOfStudy varchar(100),
		StartDate date,
		EndDate date,
		Description text,
		foreign key (UserID) references Users(UserID)
);
create table ExperienceRecords (
		ExperienceID int auto_increment primary key,
		UserID int,
		CompanyName varchar(255),
		Title varchar(100),
		Location varchar(100),
		StartDate date,
		EndDate date,
		Description text,
		foreign key (UserID) references Users(UserID)
);