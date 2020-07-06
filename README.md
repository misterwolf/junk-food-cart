# junk-food-cart

### install gems

`$ bundle install`

### run examples

`$ ruby example_carts.rb`

### run Specs

`$ rspec spec/`


### Excercise

= Inizio tema ======================================================================
Ho un negozio dove vendo bibite e panini
I panini hanno un'iva applicata del 10%
mentre le bibite l'hanno del 15%
Se acquisto piu' di 30 euro di merce allora non ho iva applicata.

Prezzi:
1 Hamburger: 10 euro
1 CocaCola: 3 euro
1 Tramezzini: 5 euro


=======================================================================

Per ogni cestino stampare :

————————————————————————————————————————————————————
Cestino #numero
————————————————————————————————————————————————————
#progressivo_nel_cestino | #descrizione_articolo | #quantita |  #prezzo_unitario | #prezzo_totale_iva_esclusa | #iva | #prezzo_iva_inclusa

————————————————————————————————————————————————————
Totale (senza iva): #totale_senza_iva
Iva applicata: #totale_iva
Totale (iva inclusa): #totale_senza_iva
————————————————————————————————————————————————————


Esempi:

Cestino 1:
1 Hamburger
4 CocaCola
3 Tramezzini

Cestino 2:
12 Hamburger

Cestino 3:
2 CocaCola
1 Hamburger

Cestino 4:
1 Coca Cola
1 hamburger


= Fine tema ======================================================================
