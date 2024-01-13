set serveroutput on
declare
        cursor contract_cursor is
            select *
            from CONTRACTS;
        v1 number(8 , 2);
        v2 number(8 , 2);
        v3 number(8 , 2); 
        v_new_date date;
begin

    for v_contract_record in contract_cursor loop
        v1 := calc_years_between(v_contract_record.contract_id);
        v2 := calc_installements_num(v_contract_record.contract_id);
        v3 := (v_contract_record.contract_total_fees - nvl(v_contract_record.CONTRACT_DEPOSIT_FEES , 0)) / calc_installements_number(v1 , v2);
        --DBMS_output.put_line(v3);
        v_new_date := v_contract_record.CONTRACT_STARTDATE;
        case 
            WHEN v_contract_record.CONTRACT_PAYMENT_TYPE = 'ANNUAL' THEN 
                    while v_new_date < v_contract_record.CONTRACT_ENDDATE loop
                        insert into INSTALLMENTS_PAID(INSTALLMENT_ID, CONTRACT_ID, INSTALLMENT_DATE, INSTALLMENT_AMOUNT, PAID)
                            values (INSTALLMENTS_PAID_SEQ.NEXTVAL , v_contract_record.contract_id , v_new_date , v3 , 0);
                         v_new_date := add_months(v_new_date , 12);
                    end loop;
            WHEN v_contract_record.CONTRACT_PAYMENT_TYPE = 'QUARTER' THEN 
                while v_new_date < v_contract_record.CONTRACT_ENDDATE loop
                            insert into INSTALLMENTS_PAID(INSTALLMENT_ID, CONTRACT_ID, INSTALLMENT_DATE, INSTALLMENT_AMOUNT, PAID)
                                values (INSTALLMENTS_PAID_SEQ.NEXTVAL , v_contract_record.contract_id , v_new_date , v3 , 0);
                            v_new_date := add_months(v_new_date , 3);
                        end loop;
            WHEN v_contract_record.CONTRACT_PAYMENT_TYPE = 'MONTHLY' THEN 
                while v_new_date < v_contract_record.CONTRACT_ENDDATE loop
                            insert into INSTALLMENTS_PAID(INSTALLMENT_ID, CONTRACT_ID, INSTALLMENT_DATE, INSTALLMENT_AMOUNT, PAID)
                                values (INSTALLMENTS_PAID_SEQ.NEXTVAL , v_contract_record.contract_id , v_new_date , v3 , 0);
                            v_new_date := add_months(v_new_date , 1);
                end loop;
            WHEN v_contract_record.CONTRACT_PAYMENT_TYPE = 'HALF_ANNUAL' THEN 
                while v_new_date < v_contract_record.CONTRACT_ENDDATE loop
                        insert into INSTALLMENTS_PAID(INSTALLMENT_ID, CONTRACT_ID, INSTALLMENT_DATE, INSTALLMENT_AMOUNT, PAID)
                            values (INSTALLMENTS_PAID_SEQ.NEXTVAL , v_contract_record.contract_id , v_new_date , v3 , 0);
                        v_new_date := add_months(v_new_date , 6);
                end loop;
        end case; 
    end loop;
    
end;