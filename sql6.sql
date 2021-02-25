delimiter %%

create funcition fn_imposto_de_renda(
pvlsalario decimal(10,2)
)
returns dec(10,2)
begin
	declare vimposto dec(10,2);
    
    set vimposto case
		when pvlsalario <= 1903.98 then 0
		when pvlsalario >= 1903.99 and pvlsalario <= 2826.65  then (pvlsalario *0.75)-142.80
		when pvlsalario >= 2826.66 and pvlsalario <= 3751.05  then (pvlsalario *0.15)-354.80
		when pvlsalario >= 3751.06 and pvlsalario <= 4664.68  then (pvlsalario *0.22.5)-636.13
		when pvlsalario >= 4664.69 then (pvlsalario *0.27.5)-869.36
    end;
    return vimposto;
    
end$$

delimiter ;

