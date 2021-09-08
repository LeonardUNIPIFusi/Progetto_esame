<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" >

    <xsl:output method="html" encoding="UTF-8" indent="yes"/> <!--  omit-xml-declaration="yes" controlla significato-->
    <xsl:strip-space elements="*"/> <!--  controlla significato-->

    <xsl:template match="/"> <!--tutt il doc-->
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="LL1_23.css" media="screen" />
                <script src="LL1_23.js"></script>
                <title><xsl:value-of select="//tei:title[@type='main']"/></title>
            </head>
            <body>
                <div id="Info-gen">
                    <xsl:apply-templates select="//tei:titleStmt/tei:title[@type='main']" /> <!--Titolo Principale-->
                    <div class="col_L" id="Info"><!--Sezione Contenuto principale -->
                        <!--titleStmt-->
                        <h2 class="titolo-sezione" >Informazioni Codifica</h2>
                        <div class="contenuto-sezioni"> <!--responsabilità trascrizione-->
                            <xsl:apply-templates select="//tei:titleStmt/tei:respStmt" />
                        </div>
                        <!--editionStmt-->
                        <h2 class="titolo-sezione"><xsl:value-of select="//tei:edition"/></h2>
                        <div class="contenuto-sezioni"><!--avendo più di un editionStmt nel doc xml devo selezionare solo quello al secondo livello gerarchico a partire dall' elem TeiC-->
                            <xsl:apply-templates select="//tei:editionStmt" />
                        </div>
                        <!--publicationStmt-->
                        <h2 class="titolo-sezione">Pubblicazione</h2>
                        <div class="contenuto-sezioni">
                            <xsl:apply-templates select="//tei:publicationStmt" />
                            <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>    <!--CDATA serve per marcare testo ed indicare che non deve essere interpretato dal compilatore-->                             
                        </div>
                        <!--sourceDesc-->
                        <h2 class="titolo-sezione">Dettagli della fonte originale</h2>
                        <div class="contenuto-sezioni">
                            <xsl:apply-templates select="//tei:sourceDesc" />
                        </div>
                    </div>
                   
                    <!--msDesc support-->
                    <div class="col_R" id="descrizione_manoscritto">
                        <h2 class="titolo-sezione">Descrizione del supporto fisico</h2>
                        <div class="contenuto-sezioni">
                            <xsl:apply-templates select="//tei:msDesc//tei:support"/>
                        </div>
                    
                     <!-- MANI -->
                        <h2 class="titolo-sezione">Scrittura della lettera e annotazioni</h2>
                        <div id="mani" class="contenuto-sezioni">
                            
                            <p><xsl:value-of select="tei:handDesc/tei:handNote[1]" /></p><!--il primo paragrafo contiene la parte più descrittiva, ma in caso di aggiunte si dovrà avere cura a lasciarne la posizione invariata -->
                            <xsl:apply-templates select="//tei:handDesc/tei:handNote"/>
                        </div>
                    </div>                
                </div>

                <!-- Divisore estetico trasparente --> 
                <hr class="rounded"/>


                <div id="scan-e-minute">
                    <!-- SCAN -->
                    <div id="immagini">
                        <h2>Immagini del manoscritto originale</h2>
                        <div id="riq_img">
                            <div style="text-align:center">
                                <span class="dot" id="dot_1" >1</span>
                                <span class="dot" id="dot_2" >2</span>
                            </div>
                            <xsl:apply-templates select="//tei:facsimile"/>
                            <xsl:apply-templates select="//tei:surface"/>
                        </div> 
                    </div>
                    <!--LETTERE-->
                    <div id="minute">   
                        <div id="Vers">
                            <h3>Versioni:</h3>
                            <button id="b_diplo" >Diplomatica</button>
                            <button id="b_interp">Interpretativa</button> 
                        </div>  
                        <div id="LL1_23_I" class="lett">
                            <xsl:apply-templates select="//tei:title[@n='1']"/> 
                            <div id="opener_lettera">
                                <xsl:apply-templates select="//tei:opener[@n='o_1']"/>
                            </div>
                            <div id="body_lettera">
                                <xsl:apply-templates select="//tei:div[@n='23_I']"/>
                            </div>
                        </div>
                        <div id="LL1_23_II" class="lett">
                            <xsl:apply-templates select="//tei:title[@n='2']"/>
                            <div id="opener_lettera">
                                <xsl:apply-templates select="//tei:opener[@n='o_2']"/><!--call template nome-->
                            </div>
                            <div id="body_lettera">
                                <xsl:apply-templates select="//tei:div[@n='23_II']"/>
                            </div>
                        </div> 
                    </div>
                </div>


            <hr class="rounded"/>


            <div class="col_L">
                <div id="note" class="contenuto-sezioni">
                    <h2>Note:</h2>
                    <ul><xsl:apply-templates select="//tei:div[@type='notes']/tei:note" /></ul>
                </div>  
                <div id="Biblio" class="contenuto-sezioni">
                    <h2>Bibliografia:</h2>
                    <ul><xsl:apply-templates select="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl" /></ul>
                </div>
                <div id="Fonti" class="contenuto-sezioni">
                    <h2>Fonti:</h2>
                    <ul><xsl:apply-templates select="//tei:div[@type='lists']/tei:listBibl" /></ul>
                </div>
                <!-- TERMINOLOGIA -->                
                <div id="terminologia" class="contenuto-sezioni">
                    <h2>Terminologia utilizzata:</h2>
                    <ul><xsl:apply-templates select="//tei:div[@type='lists']/tei:list[@type='terminology']"/></ul>
                </div>
            </div>

            <div class="col_R">
                <div id="persone_citate" class="contenuto-sezioni">
                    <h2><xsl:value-of select="//tei:listPerson/tei:head"/></h2>
                    <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson"/>
                </div>
                <div id="luoghi_citati" class="contenuto-sezioni">
                    <h2><xsl:value-of select="//tei:listPlace/tei:head"/></h2>

                    <xsl:apply-templates select="//tei:listPlace/tei:place"/>

                </div>
            </div>
            </body>
        </html>
    </xsl:template>
    <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Inizio dei Templates!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->


    <!--Titolo Principale-->
    <xsl:template match="//tei:title[@type='main']">
        <h1 id="main_Tit" style="text-align: center">
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>

    <!-- titleStmt -->
    <xsl:template match="//tei:titleStmt">
        <xsl:apply-templates select="/tei:respStmt"/>
    </xsl:template>
    
    <!-- respStmt -->
    <xsl:template match="//tei:respStmt">
        <div class="col">
            <h3><xsl:value-of select="tei:resp"/></h3>
            <ul>
                <xsl:apply-templates select="tei:name"></xsl:apply-templates>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="//tei:respStmt/tei:name">
        <li>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="@ref"/> <!--rimando a id persone List Pers-->
                </xsl:attribute>
                <xsl:value-of select="."></xsl:value-of>
            </xsl:element> 
        </li>
    </xsl:template>

            
    <!-- editionStmt -->
    <xsl:template match="//tei:editionStmt">
       <div><xsl:apply-templates select="tei:respStmt"/></div>
    </xsl:template>

    <!-- publicationStmt -->
    <xsl:template match="//tei:publicationStmt">
        <h3>Editore <xsl:value-of select="tei:publisher"/></h3>
        Licenza: 
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="//@target"/>
            </xsl:attribute> 
            <xsl:value-of select="tei:availability/tei:licence"/>
        </xsl:element>
    </xsl:template>    

    <!-- sourceDesc -->
    <xsl:template match="//tei:sourceDesc">
        <div>
            <p>
                <h3>Collocazione Manoscritto:</h3><xsl:value-of select="//tei:msDesc//tei:country"/>, <xsl:value-of select="//tei:msDesc//tei:settlement"/>; <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno"/>.
                <br/><h3>Identificativo Lettera:</h3><xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>           
        </div>
    </xsl:template>
   
   <!--Descrizione del supporto-->
    <xsl:template match="//tei:support">
                <h3>Descrizione del materiale:</h3>
            <!--Descrizione del materiale-->
                <xsl:value-of select="tei:material"/> 
            <!-- Filigrana -->
                <h3>Filigrana:</h3>
                <xsl:value-of select="tei:watermark"/> 
      

            <!-- Condizioni: -->

                <h3>Condizioni: </h3>
                <xsl:value-of select="./tei:p[1]"/>
    

            <!-- Segni particolari: -->
  
                <h3>Timbri e francobolli: </h3>
                <xsl:value-of select="./tei:stamp"/>
          
                
                <h3>Stato di conservazione: </h3>
                <xsl:value-of select="./tei:p[2]"/><!--presenti tre paragrafi distinti in support-->
            
                <xsl:apply-templates select="./tei:p[3]"/>


            <!--Dimensioni-->
          
                <h3>Dimensioni: </h3>
                <xsl:value-of select="concat('Dimensioni (in ', //tei:extent/tei:dimensions/@unit, '):')"/>
                <xsl:value-of select="//tei:extent/tei:dimensions/tei:height"/> x <xsl:value-of select="//tei:extent/tei:dimensions/tei:width"/> 
           
    </xsl:template>

<!--Descrizione Mani-->
    <xsl:template match="//tei:handDesc/tei:handNote">
    <!--con una struttura meno rigida si poteva fare aggiunte più semplicemente-->
        <xsl:apply-templates select="./tei:p"/> 
    </xsl:template>
   


<!--Minute Codificate-->
    <xsl:template match="tei:title[@type='sub']">
        <h1>
            <xsl:element name="a">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('ID',@facs)"/> <!--fornisce il collegamento con l'elemento zone corrispondente alla minuta-->
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&#8226;&nbsp]]></xsl:text> 
            </xsl:element>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>


    <xsl:template match="//tei:choice">
        
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>diplo</xsl:text><!--classificato come elemento della versione diplomatica, sarà poi elaborabile in js per modificare il tipo di versione delle minute visualizzata-->
            </xsl:attribute>
            <xsl:apply-templates select="tei:abbr" />
            <xsl:apply-templates select="tei:sic" />
            <xsl:apply-templates select="tei:orig" />
        </xsl:element>

        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>hide_interp</xsl:text><!--come la classe sopra-->
            </xsl:attribute>
            <xsl:apply-templates select="tei:expan" />
            <xsl:apply-templates select="tei:corr" />
            <xsl:apply-templates select="tei:reg" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:abbr">
        <xsl:attribute name="value">  
            <xsl:value-of select="concat(. , '')"/>
        </xsl:attribute>
        <xsl:value-of select="concat(. , '')"/> 
    </xsl:template>

    <xsl:template match="//tei:corr">
        <xsl:attribute name="value">  
            <xsl:value-of select="concat(. , '')"/>
        </xsl:attribute>
        <xsl:value-of select="concat(. , '')"/> 
    </xsl:template>

    <xsl:template match="//tei:reg">
        <xsl:attribute name="value">  
            <xsl:value-of select="concat(. , '')"/>
        </xsl:attribute>
        <xsl:value-of select="concat(. , '')"/> 
    </xsl:template>

    <xsl:template match="//tei:sic">
        <xsl:attribute name="value">  
            <xsl:value-of select="concat(. , '')"/>
        </xsl:attribute>
        <xsl:value-of select="concat(. , '')"/>
    </xsl:template>

    <xsl:template match="//tei:expan">
        <xsl:attribute name="value">  
            <xsl:value-of select="concat(. , '')"/>
        </xsl:attribute>
        <xsl:value-of select="concat(. , '')"/>
    </xsl:template>

    <xsl:template match="//tei:orig">
        <xsl:attribute name="value">  
            <xsl:value-of select="concat(. , '')"/>
        </xsl:attribute>
        <xsl:value-of select="concat(. , '')"/>
    </xsl:template>

    <xsl:template match="//tei:subst">
        <xsl:choose>

            <xsl:when test="tei:del/@rend = 'overtype'">
                <xsl:element name="del">
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat(tei:del, '')"/>
                    </xsl:attribute>
                    <xsl:attribute name="class">
                        <xsl:text>diplo</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="concat('(',tei:del,')')"/> 
                </xsl:element>

                <xsl:element name="span">
                        <xsl:attribute name="value">
                            <xsl:value-of select="concat(tei:add, '')"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat('' ,tei:add, '')"/>   
                </xsl:element>
            </xsl:when>

            <xsl:otherwise>
                <xsl:apply-templates select="tei:del"/>
                <xsl:value-of select="tei:add"/>
            </xsl:otherwise>

        </xsl:choose>
    </xsl:template>

    <xsl:template match="//tei:surplus">
        <xsl:value-of select="concat( '(', . ,')' )"/>
    </xsl:template>

    <xsl:template match="//tei:add/tei:surplus">
        <xsl:value-of select="concat( '(', . ,')' )"/>
    </xsl:template>

    <xsl:template match="*[@rend='supralinear']">
        <xsl:element name="sup">
            <xsl:attribute name="class">
                <xsl:text>diplo</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>diplo</xsl:text>
            </xsl:attribute>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
            <xsl:element name="del">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(. , ' ')"/>
                </xsl:attribute>
            <xsl:apply-templates/>
            </xsl:element>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
        </xsl:element>
    </xsl:template>

    
    <xsl:template match="//tei:persName//tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>hide_interp</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:del/tei:gap">
        <xsl:element name="span">
            <xsl:value-of select="concat(' (',@reason,', ', @extent,') ')"/>
    
        </xsl:element>
    </xsl:template>

<!--L'attr rend dell'ele hi contiene istruzioni css-->
    <xsl:template match="//tei:hi[@rend]">
        <xsl:element name="span">
            <xsl:attribute name="style">
                <xsl:value-of select="@rend"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <!-- Reference -->
    <xsl:template match="*[@ref]">
        <xsl:apply-templates /> <!-- uso un apply-templates vuoto per mostrare la parola prima della ref, altrimenti l'elemento a sostituisce il testo precedente-->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <sub><xsl:text>&#8505;</xsl:text></sub>
        </xsl:element>     
    </xsl:template>
    
    
    <!-- Riferimento note nel testo -->
    <xsl:template match="//tei:ptr"><!--al match con l'elemento ptr si crea un a con attr href collegante con la nota di riferimento e contenente il numero della nota-->
        <xsl:variable name="pos" select="string-length(@target)"/>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <sup><xsl:value-of select="concat('[',substring(@target, $pos, 1),']')"/></sup>
        </xsl:element>
    </xsl:template>


    <xsl:template match="*[@facs]"><!--al match con l'attributo facs si va a capo e si crea un elemento html 'a' contenente un puntino ad altezza di metà della riga-->
        <br />
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:value-of select="concat('ID',@facs)"/>
            </xsl:attribute>
            <xsl:text disable-output-escaping="yes"><![CDATA[&#8226;&nbsp]]></xsl:text> 
        </xsl:element>

    </xsl:template>
    <xsl:template match="tei:text[@type='letter']//*[@facs]"><!--al match con l'attributo facs, contenuto in un text di tipo letter, si va a capo e si crea un elemento html 'a' contenente un numero indicante la riga corrispondente-->
        <br />
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:value-of select="concat('ID',@facs)"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>line</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="substring-after(@n,'_' )"/> <!--linee numerate-->
        </xsl:element>

    </xsl:template>

<xsl:template match="//tei:facsimile">
    <xsl:for-each select="tei:surface/tei:graphic"> 
        <xsl:variable name="position" select="position()"/> <!--contatore delle img-->
        <xsl:element name="img">
            <xsl:attribute name="class">
                <xsl:text>lato_img</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="usemap">
                <xsl:value-of select="concat('#map_' , $position)" /><!--usemap="map_1"-->
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="concat('img_' , $position)"/> 
            </xsl:attribute>   
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:for-each>
            
</xsl:template>
<xsl:template match="//tei:surface">
        <xsl:variable name="pos" select="./@n"/>
        <xsl:element name="map">
            <xsl:attribute name="name">
                <xsl:value-of select="concat('map_' , $pos)"/><!--map_@n-->
            </xsl:attribute>
            <xsl:for-each select="./tei:zone">

                <xsl:element name="area">    
                    <xsl:variable name="ulx" select="@ulx"/>
                     <xsl:variable name="uly" select="@uly"/>
                     <xsl:variable name="lrx" select="@lrx"/>
                     <xsl:variable name="lry" select="@lry"/>
                    <xsl:attribute name="shape">
                        <xsl:value-of select="@type" />
                    </xsl:attribute>
                    <xsl:attribute name="coords">
                        <xsl:value-of select="concat($ulx ,', ' , $uly , ', ' , $lrx,', ' , $lry)" />
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('#ID#', @xml:id)"/> <!--ID del facs corrispondente, che al click viene così evidenziato-->
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
<!--Lista NOTE-->
    <xsl:template match="//tei:div[@type='notes']/tei:note">    
        <xsl:element name="li">         <!-- <li id="LL1_1_note1"> testotesto [Fonte:<a href="#...">fonte</a>...] -->
            <xsl:attribute name="id"> 
                <xsl:value-of select="concat(@xml:id, '')"/> 
            </xsl:attribute>               
            <xsl:value-of select="tei:p"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            [Fonte: 
            <xsl:element name="a">
                <xsl:attribute name="href"> 
                    <xsl:value-of select="concat(@source, '')"/>
                </xsl:attribute>
                Seminara 2017</xsl:element>,
                p.<xsl:value-of select="tei:bibl/tei:citedRange"/>,
                n.<xsl:value-of select="@ana"/>
            ]
        </xsl:element>
    </xsl:template> 

    <xsl:template match="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl">
        <xsl:element name="li">         <!-- <li id="LL1_1_note1"> autore,data,pagine citate -->
            <xsl:attribute name="id"> 
                <xsl:value-of select="concat(@xml:id, '')"/> 
            </xsl:attribute>               
            <xsl:value-of select="tei:ref/tei:bibl/tei:author"/>, 
            <xsl:value-of select="tei:ref/tei:bibl/tei:date"/>, 
            p.<xsl:value-of select="tei:ref/tei:bibl/tei:citedRange"/>
        </xsl:element>
    
    </xsl:template>

    <!-- Fonti -->

    <xsl:template match="//tei:div[@type='lists']/tei:listBibl">
        <xsl:for-each select="tei:bibl"> 
            <li>
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <!--ciclo sugli elementi figlio di bibl-->
                    <xsl:for-each select="*">
                        <xsl:value-of select="current()"/>
                        <xsl:text>. </xsl:text>              
                    </xsl:for-each>
                </xsl:element>

            </li>     
        </xsl:for-each>
    </xsl:template>  

    <!-- TERMINOLOGIA -->

    <xsl:template match="//tei:div[@type='lists']/tei:list[@type='terminology']">
        <xsl:for-each select="tei:item"> 
            <li>
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="translate(tei:label/tei:term[@xml:id], 'CT' , 'ct')"/>
                        <!--Nella trasformata altrimenti in maiuscolo-->
                    </xsl:attribute>
                    <xsl:value-of select="tei:label/tei:term" />: 
                    <xsl:value-of select="tei:gloss" />
                </xsl:element>
            </li>     
        </xsl:for-each>
    </xsl:template>

    <!--LISTA PERSONE CITATE-->

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson">
        <xsl:element name="ul">
            <xsl:apply-templates select="./tei:person" />
        </xsl:element>
    </xsl:template>


    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person">
        <xsl:element name="li">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            Nome: <xsl:value-of select="./tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text> 
            <xsl:apply-templates select="./tei:persName/tei:forename[@type='middle']" />
            Cognome: <xsl:value-of select="./tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            <xsl:apply-templates select="./tei:persName/@role"/>
            <xsl:apply-templates select="./tei:persName/tei:roleName"/>
            Sesso:<xsl:value-of select="./tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            Data di nascita:  <xsl:apply-templates select="./tei:birth/tei:date"/> 
            Luogo di nascita:  <xsl:apply-templates select="./tei:birth/tei:placeName"/>
            <xsl:apply-templates select="./tei:death/tei:date"/>
            <xsl:apply-templates select="./tei:death/tei:placeName"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text> 
        </xsl:element>
    </xsl:template> 

    <xsl:template match="//tei:listPerson/tei:person/tei:persName/@role">
        Roulo: 
        <xsl:choose>
            <xsl:when test="../@ref"> <!--ref per termini specifici-->
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="../@ref" /> <!--l'attr ref è proprio dell'elemento padre di @role-->
                    </xsl:attribute>
                    <xsl:value-of select="."/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
         </xsl:template>   
    <xsl:template match="//tei:listPerson/tei:person/tei:persName/tei:roleName">
       Onoreficenze: <xsl:value-of select="."/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="tei:person//tei:forename[@type='middle']">
        Altri nomi: <xsl:value-of select="."/>
         <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>

     <xsl:template match="tei:person//tei:death/tei:date">
        <xsl:choose>
            <xsl:when test="./@type='unknown'">
                <xsl:text>Data di morte: sconosciuta</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('Data di morte: ', .)"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>

    <xsl:template match="tei:person//tei:death/tei:placeName">
        <xsl:choose>
            <xsl:when test="./@type='unknown'">
                <xsl:text>Luogo di morte: sconosciuto</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                Luogo di morte: <xsl:apply-templates select="./tei:settlement[@type='municipality']"/> (<xsl:apply-templates select="./tei:settlement[@type='department']"/>), <xsl:value-of select="./tei:country"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
   
   <xsl:template match="tei:person//tei:birth/tei:date">
        <xsl:choose>
            <xsl:when test="./@type='unknown'">
                <xsl:text>sconosciuto</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>

    <xsl:template match="tei:person//tei:birth/tei:placeName">
        <xsl:choose>
            <xsl:when test="./@type='unknown'">
                <xsl:text>sconosciuto</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="./tei:settlement[@type='municipality']"/> (<xsl:apply-templates select="./tei:settlement[@type='department']"/>), <xsl:value-of select="./tei:country"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>

    
    <xsl:template match="//tei:settlement[@type='municipality']">
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@ref"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>
    <xsl:template match="//tei:settlement[@type='department']">
        <xsl:value-of select="./@key"/>
    </xsl:template>

    
    <xsl:template match="//tei:listPlace/tei:place">
     <xsl:element name="div"> 
     <xsl:attribute name="style">
        <xsl:text>display:flex;</xsl:text> <!--fix per la visualizzazione dell'elemento summary-->
     </xsl:attribute>
        <xsl:variable name="ref1">
            <xsl:value-of select="tei:placeName/@ref" />
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:text disable-output-escaping="yes"><![CDATA[&#8226;&nbsp]]></xsl:text> 
        </xsl:element>
        <xsl:choose> 
            <xsl:when test="tei:note/tei:p"> <!--quando è presente una descrizione del luogo-->
                <xsl:element name="details">
                    <xsl:element name="summary">
                        <xsl:value-of select="tei:placeName" />,
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="substring-before($ref1, ' ' )" />
                            </xsl:attribute>
                            Geonames, 
                        </xsl:element>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="substring-after($ref1, ' ' )" />
                            </xsl:attribute>
                             Treccani
                        </xsl:element>
                        , in <xsl:value-of select="tei:country" />
                         <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text> 
                    </xsl:element>
                    <xsl:element name="p">
                        <xsl:apply-templates select="tei:note/tei:p"/>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tei:placeName" />,
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="substring-before($ref1, ' ' )" />
                    </xsl:attribute>
                    Geonames, 
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="substring-after($ref1, ' ' )" />
                    </xsl:attribute>
                     Treccani
                </xsl:element>
                , in <xsl:value-of select="tei:country" />
                 <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            </xsl:otherwise>
        </xsl:choose> 
        </xsl:element>  
    </xsl:template>


    <xsl:template match="tei:listPlace/tei:place/tei:note/tei:p"><!--descrizione luogo-->
        <xsl:text disable-output-escaping="yes"><![CDATA[<i>]]></xsl:text><!--Italico-->
        <xsl:value-of select="."/>    
        <xsl:text disable-output-escaping="yes"><![CDATA[</i>]]></xsl:text>
    </xsl:template>
</xsl:stylesheet>