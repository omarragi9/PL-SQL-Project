----------------- Function to calculate the number of  Installments per year
create or replace function calc_installements_num(V_CONTRACT_ID number)
return number
is
    v_installements number(8 , 2);
begin
    select 
        case 
            WHEN CONTRACT_PAYMENT_TYPE = 'ANNUAL' THEN 1
            WHEN CONTRACT_PAYMENT_TYPE = 'QUARTER' THEN 4
            WHEN CONTRACT_PAYMENT_TYPE = 'MONTHLY' THEN 12
            WHEN CONTRACT_PAYMENT_TYPE = 'HALF_ANNUAL' THEN 2
        end as installements
        into v_installements
    from CONTRACTS
    where CONTRACT_ID = V_CONTRACT_ID;
    
    return v_installements;
end;

-- To test the function
-- select calc_installements_num(106)
-- from CONTRACTS;