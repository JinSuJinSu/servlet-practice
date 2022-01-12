show databases;

-- dbname : webdb
-- user : webdb
-- password : webdb

-- 보안 = 인증(authorization) + 권한(Authentification)

-- db 생성하기
create database webdb;

-- user 생성
create user 'webdb'@'localhost'identified by 'webdb';
grant all privileges on webdb.* to 'webdb'@'localhost';




