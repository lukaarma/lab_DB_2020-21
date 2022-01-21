# SAM BD M4 E5

Un negozio di alimentari vuole realizzare un’applicazione di basi di dati per organizzare e gestire la propria attività.

## DESCRIZIONE DEL PROBLEMA

### CATEGORIE ALIMENTO

I prodotti alimentari venduti nel negozio si distinguono in diverse categorie, fra le quali: frutta e verdura, prodotti da banco frigo, e surgelati.  
Per ciascun prodotto, si è interessati a tenere traccia del nome commerciale, della lista degli ingredienti e se il prodotto è o meno adatto a persone celiache.  
Inoltre, per frutta e verdura si conosce se si tratta o meno di coltivazioni biologiche, per i prodotti da banco frigo si conosce la data di scadenza, mentre per i surgelati si conosce la temperatura di conservazione.

### MARCA

Ciascuno dei prodotti venduti nel negozio di alimentari ha una sua marca, di cui si conoscono la Partita Iva dell’azienda, il nome e l’indirizzo della sede legale (composto da via, città e nazione).  
Si noti che il nome commerciale dei prodotti è unico per ciascuna marca, in quanto prodotti di marche diverse potrebbero avere lo stesso nome commerciale.

### SCAFFALE

Ciascuno dei prodotti venduto nel negozio è posizionato su uno scaffale all’interno dello stesso.  
Di ogni scaffale si è interessati a conoscere, oltre al codice identificativo, la corsia e l’altezza cui è posizionato.

### CLIENTE

I clienti del negozio sono invece caratterizzati da codice fiscale, cognome, nome, ed eventualmente numero della tessera per la raccolta punti.

### SCONTRINO

Per ciascuno scontrino emesso dal negozio di alimentari, per la spesa effettuata da un determinato cliente, è necessario mantenere traccia del numero dello scontrino, della data di emissione, del totale pagato (espresso in euro), dello sconto applicato e del numero di punti corrispondenti alla spesa.  
Inoltre, ciascuno scontrino tiene traccia anche della lista dei prodotti acquistati.  
Si noti che lo stesso scontrino può riguardare più prodotti (e viceversa, lo stesso prodotto può essere acquistato da più clienti con scontrini diversi) e che di ciascun prodotto si è interessati a conoscere la quantità acquistata in
ciascuno scontrino.

## RICHIESTE

1. Progettare lo schema E-R che descrive le entità e le associazioni sopra descritte. (si ricorda che lo schema concettuale deve comprendere l’indicazione delle cardinalità di associazioni e attributi e l’indicazione degli identificatori di tutte le entità
2. Tradurre lo schema E-R in tabelle di una base di dati relazionale, indicando anche eventuali vincoli di integrità referenziale.
