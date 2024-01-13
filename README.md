 PL-SQL-Project
===============================

A project for applying the concepts I've learned in SQL and PL/SQL.

In this project, there are 3 tables: **(Clients ,   Contracts and Installments paid)**. The project requirement is to calculate each installment for each contract.

### Project run

1. First, download the *project_script.rar* file and unrar it. This file contains the creation code of the tables and a sequence "that will be used in the insertion process".

*Note : You may run the Creation script file and discard step #1.*

2. Then, open the Creation script file using an editor such as "Toad" and run it as a script.

3. After that, you will have to run each file as a script to create the functions that are used in the program.
   
    - Claculate years between : This file contains a function that calculates the number of years between end data and start date based on a passed argument "contract id".
  
    - Claculate installements : This file contains a function that calculates the number of installments should be paid in a year based on a passed argument "contract id".
  
    - Claculate installements number : This file contains a function that calculates the number of installments should be paid in the whole duration of the contract.

4. Lastly, run The main program file. This file will loop over each contract using a cursor and calculate the amount of installment that should be paid per installment, which is (contract_total_fees - CONTRACT_DEPOSIT_FEES) / number of installments in the whole duration. Then the code stores the start date in a variable and loops "while this variable is less than the end date" The code will insert the date and the amount of the installment that should be paid in the INSTALLMENTS_PAID table.


## Project presentation & run : [Link](https://drive.google.com/file/d/1j0jOPK5mFUMI98yxuwWP2yAixZx6Jxq0/view?usp=drive_link).
