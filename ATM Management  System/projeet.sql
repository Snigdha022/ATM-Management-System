
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT a NUMBER prompt "Enter Your Account No:  "
ACCEPT b NUMBER prompt "Enter Your Pin:  "
ACCEPT c NUMBER prompt "Enter Your transaction type:  "
ACCEPT am NUMBER prompt "Enter Your amount:  "

CREATE OR REPLACE PROCEDURE Deposit(AccNo IN CustomerSignUp2.Account_No%TYPE)
IS 
amt number;
d number;
total_amount number;
BEGIN
    amt := &am;
    for r in (select Balance from CustomerSignUp2 where Account_No = AccNo)
	LOOP
	   d := r.Balance;
	   total_amount := d+amt ;
       update CustomerSignUp2 set Balance = total_amount where Account_No = AccNo;
	   insert into Transaction2(Account_No,Branch,Transaction_type,amount) values (X,Z,'Deposite',amt);
	
	END LOOP;   
END Deposit;
/

DECLARE
   AccNo CustomerSignUp2.Account_No%TYPE;
   pass CustomerSignUp2.Pin%TYPE;
   X CustomerSignUp2.Account_No%TYPE;
   Y CustomerSignUp2.Pin%TYPE;
   Z CustomerSignUp2.Branch%TYPE;
   S number;
   amt number;
   d number;
   total_amount number;
   bl CustomerSignUp2.Balance%TYPE;
   e Transaction2.Account_No%TYPE;
   f Transaction2.Branch%TYPE;
   g Transaction2.Transaction_type%TYPE;
   h Transaction2.amount%TYPE;
   sn number := &t;
   tu number;
   bn CustomerSignUp2.Branch%TYPE;
   
   
   
BEGIN
   AccNo := &a;
   pass := &b;
   FOR I IN (SELECT  Account_No,Pin,Branch FROM CustomerSignUp2)
   LOOP
      X := I.Account_No;
	  Y := I.Pin;
	  Z := I.Branch;
	  IF X = AccNo AND Y = pass THEN
	     DBMS_OUTPUT.PUT_LINE('Login Successfully');
		 
		 DBMS_OUTPUT.PUT_LINE('1: Deposit , 2:Withdrawn');
		 S := &c;
		 --amt := &am;
		 --select Balance into d from CustomerSignUp2 where Account_No = AccNo;
		 IF S = 1 THEN
		    Deposit(AccNo);
		    
		 END IF;
		 IF S = 2 THEN
		    select Balance into d from CustomerSignUp2 where Account_No = AccNo;
		    amt := &am;
		    IF amt<d THEN
		       total_amount := d-amt ;
			   update CustomerSignUp2 set Balance = total_amount where Account_No = AccNo;
			   insert into Transaction2(Account_No,Branch,Transaction_type,amount) values (X,Z,'Withdraw',amt);
			Else 
			   DBMS_OUTPUT.PUT_LINE('Your account balance is insufficient');
			END IF;
		    
		 END IF;
		 IF S = 3 THEN
		    
		    select Balance into bl from CustomerSignUp2 where Account_No = AccNo;
			DBMS_OUTPUT.PUT_LINE('Your Account Balance is:');
			DBMS_OUTPUT.PUT_LINE(bl);
		    
		 END IF;
		 IF S = 4 THEN
		    For m in (select Account_No,Branch,Transaction_type,amount from Transaction2 where Account_No = AccNo)
			LOOP
			   e := m.Account_No;
			   f := m.Branch;
			   g := m.Transaction_type;
			   h := m.amount;
			   DBMS_OUTPUT.PUT_LINE('Your Account number is:');
			   DBMS_OUTPUT.PUT_LINE(e);
			   DBMS_OUTPUT.PUT_LINE('Your Branch is:');
			   DBMS_OUTPUT.PUT_LINE(f);
			   DBMS_OUTPUT.PUT_LINE('Your Transaction type is:');
			   DBMS_OUTPUT.PUT_LINE(g);
			   DBMS_OUTPUT.PUT_LINE('Your Transaction amount is:');
			   DBMS_OUTPUT.PUT_LINE(h);
			
			END LOOP;
			
		    
		 END IF;
		 IF S = 5 THEN
		    for R in (select Branch,pin from CustomerSignUp2 where Account_No = AccNo)
			LOOP
			  tu := R.pin;
			  bn := R.Branch;
			  DBMS_OUTPUT.PUT_LINE('See our Current Password:');
			  DBMS_OUTPUT.PUT_LINE(tu);
			  IF bn = 'Rajshahi' THEN
			
			     update CustomerSignUp2 set Pin = sn where Account_No = AccNo;
			 -- ELSE
			     --update CustomerSignUp1@tuli set CustomerSignUp1.Pin@tuli = sn where CustomerSignUp1.Account_No@tuli = AccNo;
			  END IF;
			
			END LOOP;
			
		    
		    --update CustomerSignUp2 set Pin = sn where Account_No = AccNo;
		    
		    
		 END IF;
		 
		 
	  END IF;
	  IF X = AccNo AND Y != pass THEN
	     DBMS_OUTPUT.PUT_LINE('Login Failed');
	  END IF;
	 
   END LOOP;

END;
/
