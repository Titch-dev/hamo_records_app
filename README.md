# hamo_records_app
Hamo washing machine record and audit trail app


## What is Hamo Records app?
The Hamo Records app is a tool that generates a complete backend MySql database where you can create, read, update and delete records in the hamo records database.

It has been programmed using python flask framework

## Installation
### Clone the repository
Navigate to the directory folder you wish to clone the hamo_records_app and enter the following command:
```
$ git clone https://github.com/Titch-dev/hamo_records_app.git

$ cd hamo_records_app
```
The hamo_records_app folder already comes with the virtual environment ready populated with required packages to run the application. (requirements.txt is included listing all packages needed)

## Generate the CRUD backend
### Download MySQL
Download the MySQL Installer:
https://dev.mysql.com/downloads/installer/

Follow the installation instructions, setting your admin and admin password

### Creating the Database
Open hamo_records_db.sql in your prefered IDE or text editor. Copy all syntax and paste into mysql shell:
```
mysql> CREATE DATABASE hamo_records_db; 
       USE hamo_records_db; 
       CREATE TABLE IF NOT EXISTS hamo_wash_cycle(
       id INT.....
       .....PRIMARY KEY (`id`)
       ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
 ```
 The database is now created.
 
 
### Creating Database User
You will need to create a MySQL user and grant all privileges. In the mysql shell create a new user:
```
mysql> CREATE USER 'hamo_records_db'@'localhost' IDENTIFIED BY 'testpassword';

mysql> GRANT ALL PRIVILEGES ON hamo_records_db . * TO 'hamo_records_db'@'localhost';
```

## Launching the application
### Launching in local environment
In the terminal navigate to /hamo_records directory:
```
$ cd hamo_records
```
Activate the virtual environment:
```
$ source env/Scripts/activate
```
Run the hamoapp.py file using the following command:
```
$ python hamoapp.py
```
Now open your prefered web browser and navigate to http://127.0.0.1:5000/

## Basic Usage
### Landing/Index page
Here the user is able to:
  * View An abridged version of all hamo records created in descending order
  * Click a link to view deleted hamo records *(nav bar)*
  * Click a link to create a new hamo record  *(nav bar)*
  * Click a link to view all information of chosen record *(once a record is created)*
  * Click a link to delete a chosen record *(once a record is created)*

### Adding a Hamo record
Click the *Add New Hamo Record* link located in the nav bar.
  * Fill out the required fields in stage one and submit
  * Fill out the required fields in stage two and submit
  * Fill out the required fields in stage three and submit

Once the stage three data has been submitted the user will be redirected back to the landing/index page where the most recent hamo record will be displayed.
