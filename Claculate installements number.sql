----------------- Function to calculate the number of installements in the whole duration
create or replace function calc_installements_number(V_DURATION number , v_installements number)
return number
is
    v_installements_amount number(8,2);
begin

    v_installements_amount := V_DURATION * v_installements;
    return v_installements_amount;
    
end; 

-- To test the function
--select calc_installements_amount(5 , 2)
--from contracts;

