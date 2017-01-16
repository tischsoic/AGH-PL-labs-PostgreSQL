select nazwa from klienci
where nazwa like '% % %';

select telefon as telefon_stacjonarny from klienci
where telefon ~ '^0[1-9]{2} [0-9]{3} [0-9]{2} [0-9]{2}$';

select telefon from klienci
where telefon ~ '^[0-9]{3} [0-9]{3} [0-9]{3}$';

