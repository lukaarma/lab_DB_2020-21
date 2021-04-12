# Esercizi 12/04/2002

## Indicare il risultato delle seguenti interrogazioni su 'menu.xml'

<details>
<summary>menu.xml</summary>

```XML
<?xml version="1.0"?>
<Menu>
    <Primi>
        <Primo id="PennePomodoro">
            <Costo>5.00</Costo>
        </Primo>
        <Primo id="Lasagne">
            <Costo>8.00</Costo>
            <KCal>151</KCal>
        </Primo>
    </Primi>
    <Secondi>
        <Secondo id="Paillard">
            <Costo>7.00</Costo>
            <KCal>110</KCal>
            <Contorno>patate al forno</Contorno>
        </Secondo>
        <Secondo id="QuartoPolloSpiedo">
            <Costo>9.00</Costo>
            <KCal>250</KCal>
            <Contorno>purea di patate</Contorno>
        </Secondo>
    </Secondi>
</Menu>
```

</details>
<br>

1. ```XQuery
    doc("menu.xml")//Primi/*[2]
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <Primo id="Lasagne">
        <Costo>8.00</Costo>
        <KCal>151</KCal>
    </Primo>
    ```

    </details>
    <br>

2. ```XQuery
    doc("menu.xml")//Secondo[2]
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <Secondo id="QuartoPolloSpiedo">
        <Costo>9.00</Costo>
        <KCal>250</KCal>
        <Contorno>purea di patate</Contorno>
    </Secondo>
    ```

    </details>
    <br>

3. ```XQuery
    doc("menu.xml")/Menu/*/*[Costo > 7.00]
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <Primo id="Lasagne">
        <Costo>8.00</Costo>
        <KCal>151</KCal>
    </Primo>

    <Secondo id="QuartoPolloSpiedo">
        <Costo>9.00</Costo>
        <KCal>250</KCal>
        <Contorno>purea di patate</Contorno>
    </Secondo>
    ```

    </details>
    <br>

4. ```XQuery
    for $p in doc("menu.xml")//Primo  
    where $p/@id = "PennePomodoro"  
    return $p/Costo
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <Costo>5.00</Costo>
    ```

    </details>
    <br>

5. ```XQuery
    for $s in doc("menu.xml")/Menu/*/*  
    where $s/Costo >= 8.00 and $s/Costo <= 10.00  
    return <Selezione> {$s} </Selezione>
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <Selezione>
        <Primo id="Lasagne">
            <Costo>8.00</Costo>
            <KCal>151</KCal>
        </Primo>
    </Selezione>

    <Selezione>
        <Secondo id="QuartoPolloSpiedo">
            <Costo>9.00</Costo>
            <KCal>250</KCal>
            <Contorno>purea di patate</Contorno>
        </Secondo>    
    </Selezione>
    ```

    </details>
    <br>

## Indicare il risultato delle seguenti interrogazioni su 'corsi.xml'

<details>
<summary>corsi.xml</summary>

```XML
<?xml version="1.0" encoding="UTF-8"?>
<CdL codice="F1A">
    <nome>SSRI</nome>
    <erogazione>online</erogazione>
    <anno num="1">
        <corso quadrimestre="primo">
            <titolo>Programmazione</titolo>
            <docente>M. Anisetti</docente>
        </corso>
        <corso quadrimestre="secondo">
            <titolo>Architettura degli Elaboratori</titolo>
            <docente>N. Scarabottolo</docente>
        </corso>
    </anno>
    <anno num="2">
        <corso quadrimestre="primo">
            <titolo>Algoritmi e strutture dati</titolo>
            <docente>S. De Capitani di Vimercati</docente>
        </corso>
        <corso quadrimestre="secondo">
            <titolo>Basi di dati</titolo>
            <docente>P. Samarati</docente>
        </corso>
        <corso quadrimestre="terzo">
            <titolo>Crittografia</titolo>
            <docente>S. Cimato</docente>
        </corso>
    </anno>
</CdL>

```

</details>
<br>

1. ```XQuery
    doc("corsi.xml")//corso[@quadrimestre = "secondo"]/docente
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <docente>N. Scarabottolo</docente>
    <docente>P. Samarati</docente>
    ```

    </details>
    <br>

2. ```XQuery
    doc("corsi.xml")/CdL/anno[corso/titolo = "Programmazione"]/@num
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    1
    ```

    </details>
    <br>

3. ```XQuery
    doc("corsi.xml")//corso[docente = "P. Samarati"]/*
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <titolo>Basi di dati</titolo>
    <docente>P. Samarati</docente>
    ```

    </details>
    <br>

4. ```XQuery
    for $c in doc("corso.xml")//corso  
    where $c/titolo = "Crittografia"  
    return $c/docente
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <docente>S. Cimato</docente>
    ```

    </details>
    <br>

5. ```XQuery
    let $c := doc("corso.xml")//corso[@quadrimestre = "secondo"]  
    return <secondo> {$c} </secondo>
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <secondo>
        <corso quadrimestre="secondo">
            <titolo>Architettura degli Elaboratori</titolo>
            <docente>N. Scarabottolo</docente>
        </corso>

        <corso quadrimestre="secondo">
            <titolo>Basi di dati</titolo>
            <docente>P. Samarati</docente>
        </corso>
    </secondo>
    ```

    </details>
    <br>

## Indicare il risultato delle seguenti interrogazioni su 'libreria.xml'

<details>
<summary>libreria.xml</summary>

```XML
<?xml version="1.0"?>
<catalogo>
    <libro disponibile="true">
        <titolo>Il nome della rosa</titolo>
        <autore>Umberto Eco</autore>
        <editore>Feltrinelli</editore>
        <prezzo>50.0</prezzo>
    </libro>
    <libro disponibile="false">
        <titolo>Delfini</titolo>
        <autore>Banana Yoshimoto</autore>
        <editore>Feltrinelli</editore>
        <prezzo>40.0</prezzo>
    </libro>
    <libro disponibile="false">
        <titolo>Dieci piccoli indiani</titolo>
        <autore>Agatha Christie</autore>
        <editore>Mondadori</editore>
        <prezzo>30.0</prezzo>
    </libro>
    <libro disponibile="true">
        <titolo>Seta</titolo>
        <autore>Alessandro Baricco</autore>
        <editore>Mondadori</editore>
        <prezzo>10.0</prezzo>
    </libro>
</catalogo>
```

</details>
<br>

1. ```XQuery
    doc("libreria.xml")//libro[editore = "Feltrinelli" and @disponibile = "true"]
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <libro disponibile="true">
        <titolo>Il nome della rosa</titolo>
        <autore>Umberto Eco</autore>
        <editore>Feltrinelli</editore>
        <prezzo>50.0</prezzo>
    </libro>
    ```

    </details>
    <br>

2. ```XQuery
    doc("libreria.xml")//libro/*[2]
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <autore>Umberto Eco</autore>
    <autore>Banana Yoshimoto</autore>
    <autore>Agatha Christie</autore>
    <autore>Alessandro Baricco</autore>
    ```

    </details>
    <br>

3. ```XQuery
    doc("libreria.xml")//libro[prezzo < 10]/autore
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    ```

    </details>
    <br>

4. ```XQuery
    let $lib := //libro[editore = "Feltrinelli"]  
    return count($lib)
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    2
    ```

    </details>
    <br>

5. ```XQuery
    for $lib in //libro[editore = "Feltrinelli"]  
    where $lib/prezzo > 40  
    return <costoso> {$lib/*} </costoso>
    ```

    <details>
    <summary>Soluzione</summary>

    ```XML
    <costoso>
        <titolo>Il nome della rosa</titolo>
        <autore>Umberto Eco</autore>
        <editore>Feltrinelli</editore>
        <prezzo>50.0</prezzo>
    </costoso>
    ```

    </details>
    <br>
