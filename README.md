Local storage
1. Install DBeaver -> https://dbeaver.io/download/ or PgAdmin -> https://www.pgadmin.org/download/
2. Create your practise database. https://www.postgresqltutorial.com/postgresql-create-database/ 
3. After building your database and filling the fields, it's time to do a backup.
4. In DBeaver, you can right click the database > tools > backup as seen here and click on backup. You can save the dump in whichever local directory you want. 
<img width="636" alt="Screenshot 2021-09-04 at 2 59 31 PM" src="https://user-images.githubusercontent.com/57052760/132085882-4c2348b1-2738-4aa3-9188-345095be92fa.png">
5. To backup, ```psql -U username -d dbname < filename```

Storage in EC2 

1. Backup 

<img width="1417" alt="Screenshot 2021-09-04 at 2 40 28 PM" src="https://user-images.githubusercontent.com/57052760/132085702-0b3fa736-43cf-44e8-8d69-053bac2c1248.png">
# Postgres_backup
