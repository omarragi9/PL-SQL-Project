------- Function to calculate the duration between the end_data and the start_date
create or replace function calc_years_between(V_CONTRACT_ID number)
return number
is
    V_DURATION number(8 , 2);
begin

    select months_between(CONTRACT_ENDDATE , CONTRACT_STARTDATE)
        into V_DURATION
    from CONTRACTS
    where CONTRACT_ID = V_CONTRACT_ID;
    
    return V_DURATION / 12;
    
end;

-- To test the function
-- select calc_years_between(106)
-- from CONTRACTS;