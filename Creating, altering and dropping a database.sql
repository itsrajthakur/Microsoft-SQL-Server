CREATE DATABASE demo; -- create database

SELECT * FROM sys.databases; --databases property

SELECT * FROM sys.databases WHERE name = 'demo';

SELECT name FROM sys.databases WHERE name = 'demo';

ALTER DATABASE demo MODIFY NAME = demo2; -- alter name

ALTER DATABASE demo SET COMPATIBILITY_LEVEL = 160; --compatibility level

SP_RenameDb 'demo2','demo'; -- rename

drop database demo; --drop or delete