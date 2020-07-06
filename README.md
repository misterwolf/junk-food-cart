# junk-food-cart

### download repository
`$ git clone git@github.com:misterwolf/junk-food-cart.git`

### install gems

`$ bundle install`

### run examples

`$ ruby example_carts.rb`

### run Specs

`$ rspec spec/`

### Questions

- in receipt recap, should we remove the TAX entries ("Iva applicata" and "Totale (iva inclusa)"") when not applied?
- it's normal add two decimal place for floating currency Number
  - should we instead need change this?

- decimal place
  - should we remove them when number is integer?
  - should we remove them when number is 0?

### Excercise

= Inizio tema ======================================================================
Ho un negozio dove vendo bibite e panini.
I panini hanno un'iva applicata del 10% mentre le bibite l'hanno del 15%.
Se acquisto piu' di 30 euro di merce allora non ho iva applicata.

Prezzi:

1 Hamburger: 10 euro

1 CocaCola: 3 euro

1 Tramezzino: 5 euro



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

### Visual Examples

_Cestino 1_

- **1** Hamburger

- **4** CocaCola

- **3** Tramezzini


_Cestino 2_

- **12** Hamburger


_Cestino 3_

- **2** CocaCola

- **1** Hamburger


_Cestino 4_

- **1** Coca Cola

- **1** hamburger

= Fine tema ======================================================================
