Create or replace function PersonelAzalt()
	returns trigger
	as
	$$
begin 
update "HASTANE_BINASI" set "PersonelSayisi" = "PersonelSayisi" - 1;
return new;
end;
$$
language plpgsql;

create trigger PersonelAzaltTrigger 
after delete
on "PERSONEL"
for each row
execute procedure  PersonelAzalt();

select * from "PERSONEL"



--insert into "PERSONEL"
--("SicilNo","TCKimlikNo","Ad","Soyad","DogumTarihi","TelNo","Maas", "PersonelTipi")
--values
--('2','323456789','Zehra','Bak','26/2/2002','5077975082','2000','Doktor');
--
--select * from "PERSONEL"




