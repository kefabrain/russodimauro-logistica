# Etichette colli · «Nessun collo dimenticato»

Ogni collo prende la sua etichetta, si sa sempre dov'è, e il camion parte solo con tutti i colli del cliente.

## Link

- **App online (pubblica):** https://kefabrain.github.io/russodimauro-logistica/
- **App su Claude (privata, da condividere dal menu Condividi):** https://claude.ai/artifact/19S2J92Y9zsuk98qEoP53H
- **Repository:** https://github.com/kefabrain/russodimauro-logistica

Un solo file: `index.html`. Si usa dal link qui sopra oppure, scaricato, con doppio clic nel browser del PC del magazzino. Serve internet solo per caratteri e codici a barre.

## Dal telefono

Il link pubblico si apre da qualsiasi telefono, senza account. Su iPhone: Safari → Condividi → «Aggiungi a Home»; su Android: Chrome → ⋮ → «Aggiungi a schermata Home». Si apre come un'app: menu in basso (Crea etichette · Interroga magazzino · Prepara consegna), pulsanti grandi, numero di colli con − e +, fotocamera a schermo intero che legge i codici a barre uno dopo l'altro, con vibrazione a ogni collo.

## Come si usa

1. **Crea etichette** — nome e cognome del cliente, indirizzo, n. ordine (facoltativi), articoli con il numero di colli e il posto dove si appoggiano (es. `A-03`). «Crea e stampa etichette» genera un'etichetta 10×15 cm per collo: logo, cliente, articolo, collo 2/5, posto, codice a barre `RDM00012`. Si stampa su stampante etichette 10×15 oppure su A4 (4 per foglio).
2. **Interroga magazzino** — cerca per nome, oppure premi «Scansiona» (o spara con la pistola) il codice di un collo per vedere dov'è e per chi, o l'etichetta di uno scaffale per vedere cosa c'è sopra. elenco di tutti i colli con posto e stato. «Sposta un collo»: spari il collo, poi il nuovo posto. «Etichetta per scaffale»: scrivi il posto nella ricerca e stampa il cartello con il suo codice a barre.
3. **Prepara consegna** — scrivi «Rossi»: esce la lista picking ordinata per posto («Vai in A-03 e prendi Divano, collo 1 di 4»). Si spara ogni collo mentre si carica. Collo di un altro cliente → messaggio rosso, «rimettilo in B-02». Il pulsante «Il camion parte» si accende solo a 4/4; a quel punto i colli passano a «Consegnato» con data e ora.

Lettore: qualsiasi pistola USB o bluetooth (scrive il codice e preme Invio), oppure «Usa la fotocamera» da telefono o tablet.

Stesso cliente + stesso n. ordine arrivati in più volte: i colli si sommano e la numerazione continua.

## Limiti di questa prima versione

- I dati restano nel browser del computer dove si usa (`localStorage`). Etichette e picking vanno fatti sullo stesso PC, con la pistola senza fili per arrivare al camion. «Salva una copia» scarica un file di backup, «Carica una copia» lo ripristina.
- Per più postazioni insieme (PC + telefoni) serve un archivio condiviso: passo successivo, da collegare agli ordini del gradino 2 (giacenze) così l'etichetta si compila da sola.

## Materiale consigliato (da verificare con l'azienda)

- Stampante etichette termica 10×15 cm (tipo Zebra/Brother) oppure stampante A4 con fogli adesivi 4 per foglio.
- Pistola barcode senza fili.
