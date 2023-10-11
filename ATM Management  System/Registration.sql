clear screen;


SET SERVEROUTPUT ON;
SET VERIFY OFF;


create table CustomerSignUp2(
       Account_No number, 
       Name varchar2(20), 
	   Address varchar2(20), 
	   Pin number,
	   Education varchar2(20), 
	   Occupation varchar2(20),
	   phone VARCHAR2(15),  
	   Dob date, 
	   Branch varchar2(20),
	   Balance number,
	   PRIMARY KEY (Account_No));
	   
create table Transaction2(
       Account_No number, 
       Branch varchar2(20), 
	   Transaction_type varchar2(20), 
	   amount number);
	   
	   
	   
--insert into CustomerSignUp2(Account_No, Name, Address, Pin,  Education, Occupation, Phone, Dob, Branch) values (1001,'Snigdha','Mirpur',1234, 'HSC', 'student', '01711122333', '27-Dec-01', 'Rajshahi');
--insert into CustomerSignUp2(Account_No, Name, Address, Pin,  Education, Occupation, Phone, Dob, Branch) values (1002,'Tuli','Dhanmondi',12345, 'HSC', 'student', '01711122333', '05-Sep-01', 'Rajshahi');
--insert into CustomerSignUp2(Account_No, Name, Address, Pin,  Education, Occupation, Phone, Dob, Branch) values (1003,'Jeba','Niketon',123, 'HSC', 'student', '01711122333', '11-Feb-01', 'Rajshahi');




ACCEPT a NUMBER prompt "Enter Your Account No:  "
ACCEPT b NUMBER prompt "Enter Your Pin:  "
ACCEPT c CHAR prompt "Enter Your Name:  "
ACCEPT d CHAR prompt "Enter Your address:  "
ACCEPT e CHAR prompt "Enter Your educational qualification:  "
ACCEPT f CHAR prompt "Enter Your occupation:  "
ACCEPT g CHAR prompt "Enter Your phone:  "
ACCEPT h char prompt "Enter Your DOB:  "
ACCEPT i CHAR prompt "Enter Branch Name:  "



DECLARE
   AccNo CustomerSignUp2.Account_No%TYPE;
   name CustomerSignUp2.Name%TYPE;
   addr CustomerSignUp2.Address%TYPE;
   pass CustomerSignUp2.Pin%TYPE;
   edu CustomerSignUp2.Education%TYPE;
   ocu CustomerSignUp2.Occupation%TYPE;
   phn CustomerSignUp2.Phone%TYPE;
   db CustomerSignUp2.Dob%TYPE;
   bnch CustomerSignUp2.Branch%TYPE;
   
   
   
   
   
BEGIN
   
   AccNo := &a;
   
   name := &c;
   addr := &d;
   pass := &b;
   edu := &e;
   ocu := &f;
   phn := &g;
   db := &h;
   bnch := &i;
   if bnch = 'Rajshahi' THEN
        insert into CustomerSignUp2(Account_No, Name, Address, Pin,  Education, Occupation, Phone, Dob, Branch,Balance) values (AccNo,name,addr,pass,edu,ocu,phn,db,bnch,0);
   
   ELSE
   
        insert into CustomerSignUp1@tuli values (AccNo,name,addr,pass,edu,ocu,phn,db,bnch,0);
   END IF;
   --insert into CustomerSignUp2(Account_No, Name, Address, Pin,  Education, Occupation, Phone, Dob, Branch,Balance) values (AccNo,name,addr,pass,edu,ocu,phn,db,bnch,0);
  
   
   
   
END;
/
