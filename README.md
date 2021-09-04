***Local storage***

1. Install DBeaver -> https://dbeaver.io/download/ or PgAdmin -> https://www.pgadmin.org/download/

2. Create your practise database. https://www.postgresqltutorial.com/postgresql-create-database/ 

3. After building your database and filling the fields, it's time to do a backup.

4. In DBeaver, you can right click the database > tools > backup as seen here and click on backup. You can save the dump in whichever local directory you want. 

<img width="636" alt="Screenshot 2021-09-04 at 2 59 31 PM" src="https://user-images.githubusercontent.com/57052760/132085882-4c2348b1-2738-4aa3-9188-345095be92fa.png">

To backup, 
```
psql -U username -d dbname < filename
```

***Storage in EC2***

1. In DBeaver, you can right click the database > tools > backup as seen here and click on backup. You can save the dump in whichever local directory you want.

2. To push the dump from your local computer into your S3, you will first need to install AWS CLI in your computer. -> https://github.com/aws/aws-cli/tree/v2

3. Configure your aws cli with the command ```aws configure```. Type in your access key, secret key and the default region name. To test if your aws is working, type in the following command ```aws s3 ls```. You should see the list of your buckets. Once it's working, push your dump from your local directory into the s3 with the following command ```aws s3 cp /path/to/dump s3://bucket-you-want-to-store. Eg ```aws s3 cp /Users/test/dump-suppliers-202109041447 s3://Testbucket```

4. Configure your ec2. Select whichever instance you want, and under 'configure security group', input the following. 

<img width="1417" alt="Screenshot 2021-09-04 at 2 40 28 PM" src="https://user-images.githubusercontent.com/57052760/132085702-0b3fa736-43cf-44e8-8d69-053bac2c1248.png">


5. SSH into your instance and install AWS CLI, Postgresql. You have to install AWS CLI again because your new instance does not have it. To install, use the following command ```sudo apt-get update``` and ```sudo apt install awscli```. To install Postgresql, ```sudo apt-get install postgresql postgresql-contrib```. Again, configure your AWS CLI with the command ```aws configure```. Key in your access key again, secret key as well as your default region name. 
6. Now you'll want to copy your dump from the s3 into the instance. ```aws s3 cp s3://location-of-dump-in-s3/dump dump ``` Eg, ```aws s3 cp s3://Testbucket/dump-suppliers-202109041447 dump-suppliers-202109041447```. This will copy the dump into whichever directory you're at in the instance. To check if it's there, just type ```ls```. 
7. Now create the db in postgresql, ```sudo -u postgres createdb suppliers```. This will be the place where you will restore the dump. Go into the db with ```sudo -u postgres psql```. You can ```\l``` to list the databases. You should see suppliers database inside. To quit postgresql, type ```\q``` to quit. To connect with the db, ```\c database-you-want-to-connect```. Eg, ```\c suppliers```. You should see the following ``` You are now connected to database "suppliers" as user "postgres".```
8. 
