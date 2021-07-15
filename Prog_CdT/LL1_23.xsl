<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" >

    <xsl:output method="html" encoding="UTF-8" indent="yes"/> 
    <xsl:strip-space elements="*"/> 


    <xsl:template match="/"> <!--Template applicato a tutto il doc-->
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="LL1_23.css" media="screen" />
                <script src="LL1_23.js"></script>
                <title><xsl:value-of select="//tei:teiCorpus//tei:title"/></title>
            </head>
            <body>
                <div id="Info-gen"> 
                    <xsl:apply-templates select="//tei:teiCorpus//tei:titleStmt[@n='1']/tei:title" /> <!--Titolo Principale-->
                    <div class="col_L" id="Info"><!--Sezione Contenuto principale -->
                        <h2 class="titolo-sezione" style="text-align: center" >Informazioni Generali</h2>
                        <!--titleStmt-->
                        <div class="contenuto-sezioni"> <!--responsabilità trascrizione-->
                            <xsl:apply-templates select="//tei:teiCorpus//tei:titleStmt[@n='1']/tei:respStmt" />
                        </div>
                        <!--editionStmt-->
                        <div class="contenuto-sezioni">
                            <xsl:apply-templates select="//tei:teiCorpus/*/*/tei:editionStmt" />
                        </div>
                        <!--publicationStmt-->
                        <h2 class="titolo-sezione">Pubblicazione:</h2>
                        <div class="contenuto-sezioni">
                            <xsl:apply-templates select="//tei:teiCorpus/*/*/tei:publicationStmt" />
                            <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>                                 
                        </div>
                        <!--sourceDesc-->
                        <div class="contenuto-sezioni">
                            <xsl:apply-templates select="//tei:teiCorpus/*/*/tei:sourceDesc" />
                        </div>
                    </div>
                   
                    <!--msDesc support-->
                    <div class="col_R" id="descrizione_manoscritto">
                        <h2>Descrizione del manoscritto:</h2>
                        <div>
                            <xsl:apply-templates select="//tei:msDesc//tei:support"/>
                        </div>
                    
                     <!-- MANI -->
                        <div id="mani">
                            <h2>Scrittura della lettera e annotazioni:</h2>
                            <p><xsl:value-of select="tei:handDesc/tei:handNote[1]" /></p>
                            <xsl:apply-templates select="//tei:handDesc/tei:handNote"/>
                        </div>
                    </div>                
                </div>

                <!-- Divisore estetico trasparente --> 
                <hr class="rounded"/>
            
                <!-- Div contenitore scan e lettera -->
                <div id="scan-e-lettere">
                    <!-- SCAN -->
                    <div id="immagini_lettera">
                        <h2>Immagini del manoscritto originale</h2>
                        <div id="riq_img">
                            <div style="text-align:center">
                                <span class="dot" id="dot_1" >1</span>
                                <span class="dot" id="dot_2" >2</span>
                            </div>
                            <xsl:apply-templates select="//tei:facsimile"/>
                            
                        </div> 
                    </div> 
                    <div id="lettere">
                        <div class="contenuto_front" id="contenuto_front">
                            La lettera non presenta né francobolli, né timbri, né sigilli. 
                        </div>   
                        <div id="signature_lettera">
                            <h3>Annotazione al margine sx:</h3>
                            <xsl:apply-templates select="//tei:div[@type='fragment']"/>
                        </div>
                        <div id="LL1_23_I">
                            <h3><xsl:value-of select="//tei:TEI//tei:title[@n='1']"/></h3>
                            <div id="opener_lettera">
                                <xsl:apply-templates select="//tei:opener[@n='o_1']"/>
                            </div>
                            <div id="body_lettera">
                                <xsl:apply-templates select="//tei:div[@n='23_I']"/>
                            </div>


                        </div>
                        <div id="LL1_23_II">
                            <h3><xsl:value-of select="//tei:TEI//tei:title[@n='2']"/></h3>
                            <div id="opener_lettera">
                                <xsl:apply-templates select="//tei:opener[@n='o_2']"/>
                            </div>
                            <div id="body_lettera">
                                <xsl:apply-templates select="//tei:div[@n='23_II']"/>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="col_L_1">
                    <div id="note">
                        <h2>Note</h2>
                        <ul><xsl:apply-templates select="//tei:div[@type='notes']/tei:note" /></ul>
                    </div>  
                    <div id="Biblio">
                        <h2>Bibliografia</h2>
                        <ul><xsl:apply-templates select="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl" /></ul>
                    </div>
                    <div id="Fonti">
                        <h2>Fonti</h2>
                        <ul><xsl:apply-templates select="//tei:div[@type='lists']/tei:listBibl" /></ul>
                    </div>
                    <!-- TERMINOLOGIA -->                
                    <div id="terminologia">
                        <h2>Terminologia utilizzata</h2>
                        <ul><xsl:apply-templates select="//tei:div[@type='lists']/tei:list[@type='terminology']"/></ul>
                    </div>
                    <div id="luoghi_citati">
                    <h2>Luoghi</h2>
                    <ul>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='TOR']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='TOR']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Paris']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Paris']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']" />
                            </xsl:element>
                        </li>
                    </ul>
                            
                </div>
                </div>
                <div class="col_R_1">
                <div id="persone_citate">
                    <h2>Persone</h2>
                    <ul>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AC']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LKF']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LKF']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='DS']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='DS']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GS']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GS']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AA']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AA']" />
                            </xsl:element>
                        </li>
                    </ul>
                </div>
                
                </div>              
            </body>
        </html>
    </xsl:template>



    <xsl:template match="//tei:teiCorpus/tei:teiHeader//tei:title">
        <h1 id="main_Tit" style="text-align: center">
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>



    <!-- INFORMAZIONI GENERALI DIV -->
    <!-- titleStmt -->
    <xsl:template match="//tei:titleStmt[@n='1']">
        <xsl:apply-templates select="tei:respStmt"/>
    </xsl:template>
    
    <!-- respStmt -->
    <xsl:template match="//tei:respStmt">
        <div class="col">
            <h3><xsl:value-of select="tei:resp"/></h3>
            <ul>
                <xsl:for-each select="tei:name">
                    <li><xsl:value-of select="."/></li>     
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <!-- editionStmt -->
    <xsl:template match="//tei:editionStmt">
        <h2><xsl:value-of select="tei:edition"/></h2>
        <h3><xsl:value-of select="tei:edition/date"/></h3>
        <div><xsl:apply-templates select="tei:respStmt"/></div>
    </xsl:template>

    <!-- publicationStmt -->
    <xsl:template match="//tei:publicationStmt">
        <h3><xsl:value-of select="tei:publisher"/></h3>
        Licenza: <a href="https://creativecommons.org/licenses/by/4.0/"><xsl:value-of select="tei:availability/tei:licence"/></a>
    </xsl:template>    

    <!-- sourceDesc -->
    <xsl:template match="//tei:sourceDesc">
        <div>
            <h2>Collocazione del manoscritto:</h2>
            <p>
                <xsl:value-of select="//tei:msDesc/*/tei:country"/>, <xsl:value-of select="//tei:msDesc/*/tei:settlement"/>; <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno"/>.
                <br/><h3>Identificativo Lettera:</h3><xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>           
        </div>
    </xsl:template>
    <!-- DESCRIZIONE DEL MANOSCRITTO DIV -->
    
    <!-- sourceDesc msDesc -->
    <xsl:template match="//tei:support">
        <ul>
            <p>
            <!--Descrizione del materiale-->
            <xsl:value-of select="concat('Descrizione del materiale: ',tei:material)"/> 
            <!-- Filigrana -->
            </p>
            <p>            
               
                <xsl:value-of select="concat('Filigrana: ',tei:watermark)"/> 
            </p>

            <!-- Condizioni: -->
            <p>
                <xsl:value-of select="concat('Condizioni: ',//tei:support/tei:p[1])"/>
            </p>

            <!-- Segni particolari: -->
            <p>
                <xsl:value-of select="concat('Timbri e francobolli: ', //tei:support/tei:stamp)"/>
            </p>
            <p>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('ID',//tei:support/tei:p[2]/tei:hi[1]/@facs)"/>
                    </xsl:attribute>
                </xsl:element>
            <xsl:value-of select="concat('Stato di conservazione: ', //tei:support/tei:p[2], //tei:support/tei:p[3] )"/><!--presenti due paragrafi distinti in support-->
            </p>

            <!--Dimensioni-->
            <p>
                <xsl:value-of select="concat('Dimensioni (in ', //tei:extent/tei:dimensions/@unit, '):')"/>
                <xsl:value-of select="//tei:extent/tei:dimensions/tei:height"/> x <xsl:value-of select="//tei:extent/tei:dimensions/tei:width"/> 
            </p>
        </ul>
    </xsl:template>

    <xsl:template match="//tei:handDesc/tei:handNote[@xml:id='h1']"> 
        <xsl:apply-templates select="//tei:handDesc/tei:handNote[@xml:id='h1']/tei:p"/>

    </xsl:template>
    <xsl:template match="//tei:handDesc/tei:handNote[@xml:id='h2']"> 
        <xsl:apply-templates select="//tei:handDesc/tei:handNote[@xml:id='h2']/tei:p"/>
    
    </xsl:template>
    <xsl:template match="//tei:handDesc/tei:handNote[@xml:id='h3']"> 
        <xsl:apply-templates select="//tei:handDesc/tei:handNote[@xml:id='h3']/tei:p"/>
    </xsl:template>
    
    
    <xsl:template match="*[@facs]">
        <br />
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:value-of select="concat('ID',@facs)"/>
            </xsl:attribute>
            <xsl:text disable-output-escaping="yes"><![CDATA[&#8226;&nbsp]]></xsl:text> 
        </xsl:element>

    </xsl:template>

    <!-- IMMAGINI DEL MANOSCRITTO ORIGINALE DIV -->
    <!-- Immagini delle lettere scannerizzate e map html -->
    <xsl:template match="//tei:facsimile">
        <xsl:for-each select="tei:surface/tei:graphic"> 
            <xsl:variable name="position" select="position()"/> <!--contatore img-->
            <xsl:element name="img">
                <xsl:attribute name="class">
                    <xsl:text>lato_img</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('img_' , $position)"/>  <!-- id="imglato1" -->
                </xsl:attribute>     
                <xsl:attribute name="src">
                    <xsl:value-of select="@url"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:for-each>   
    </xsl:template>
    <xsl:template match="//tei:choice">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:expan, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:expan, '')"/>
            </xsl:element>
        </select>
    </xsl:template>


    <xsl:template match="//tei:choice[@xml:id='choice_2']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
        </select>
    </xsl:template> 



    <xsl:template match="//tei:choice[@xml:id='choice_3']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
            
        </select>
    </xsl:template> 
    <xsl:template match="//tei:choice[@xml:id='choice_5']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:orig, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:orig, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:reg, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:reg, '')"/>
            </xsl:element>
            
        </select>
    </xsl:template> 

    <xsl:template match="//tei:surplus">


    </xsl:template> 

    <xsl:template match="//tei:subst">
        <xsl:choose>
            <xsl:when test="tei:del/@rend = 'overtype'">
                <select class="choice_class">
                    <xsl:element name="option">
                            <xsl:attribute name="value">
                                <xsl:value-of select="concat(tei:add, '')"/>
                            </xsl:attribute>
                            <xsl:value-of select="concat('' ,tei:add, '')"/>   
                    </xsl:element>
                    <xsl:element name="option">
                        <xsl:attribute name="value">
                            <xsl:value-of select="concat(tei:del, '')"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:del"/> 
                    </xsl:element>
                </select>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="del">
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat(tei:del, '')"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:del"/>
                </xsl:element>
                <xsl:value-of select="concat('' ,tei:add, '')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="//tei:del">
         <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
        <xsl:element name="del">
            <xsl:attribute name="value">
                <xsl:value-of select="concat(., ' ')"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
    </xsl:template>


    <xsl:template match="//tei:unclear">
        <xsl:value-of select="concat(' (',@reason,' ', @extent,' ' , @unit,') ')"/>
    </xsl:template>



    <!-- Reference -->
    <xsl:template match="*[@ref]">
        <xsl:apply-templates /> <!-- uso un apply-templates vuoto per mostrare la parola prima della ref, altrimenti viene sostituita-->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <sub><xsl:text>&#8505;</xsl:text></sub>
        </xsl:element>     
    </xsl:template>
    
    <!-- Riferimento note nel testo -->
    <xsl:template name="notes_template" match="//tei:text">
        <xsl:for-each select="tei:ptr"> 
            <xsl:variable name="position" select="position()"/>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="concat(@target, '')"/>
                </xsl:attribute>
                <sup><xsl:value-of select="concat('[',$position,']')"/></sup>
            </xsl:element>
         </xsl:for-each>
    </xsl:template>

    <xsl:template match="//tei:div[@type='notes']/tei:note">    
        <xsl:element name="li">         <!-- <li id="LL1_1_note1"> testotesto <a href="#..."> -->
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
        <xsl:element name="li">         <!-- <li id="LL1_1_note1"> testotesto <a href="#..."> -->
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
                        <xsl:value-of select="tei:label/tei:term[@xml:id]"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:label/tei:term" />: 
                    <xsl:value-of select="tei:gloss" />
                </xsl:element>
            </li>     
        </xsl:for-each>
    </xsl:template>
    <!--LISTA PERSONE CITATE-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AC']">
        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text> 
        Nome: <xsl:value-of select="//tei:person[@xml:id='AC']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='AC']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Roulo: <xsl:value-of select="//tei:person[@xml:id='AC']/tei:persName/@role"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='AC']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:placeName/tei:settlement"/>, in provincia di <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:placeName/tei:settlement[2]"/>, <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte:  <xsl:value-of select="//tei:person[@xml:id='AC']/tei:death/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:value-of select="//tei:person[@xml:id='AC']/tei:death/tei:placeName/tei:settlement"/>, in provincia di <xsl:value-of select="//tei:person[@xml:id='AC']/tei:death/tei:placeName/tei:settlement[2]"/>, <xsl:value-of select="//tei:person[@xml:id='AC']/tei:death/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text> 
        Nome: <xsl:value-of select="//tei:person[@xml:id='GD']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='GD']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Roulo: <xsl:value-of select="//tei:person[@xml:id='GD']/tei:persName[@role]"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='GD']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='GD']/tei:birth/tei:date/@type"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='GD']/tei:birth/tei:placeName/@type"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte:  <xsl:value-of select="//tei:person[@xml:id='GD']/tei:death/tei:date/@type"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:value-of select="//tei:person[@xml:id='GD']/tei:death/tei:placeName/@type"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text> 
        Nome: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:forename[1]"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Altri nomi: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:forename[1]"/>, <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:forename[2]"/>, <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:forename[3]"/>, <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:forename[4]"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Roulo: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/@role"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='VB']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Onoreficenze: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:roleName"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Soprannome:<xsl:value-of select="//tei:person[@xml:id='VB']/tei:persName/tei:addName"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='VB']/tei:birth/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:birth/tei:placeName/tei:settlement"/>, in provincia di <xsl:value-of select="//tei:person[@xml:id='VB']/tei:birth/tei:placeName/tei:settlement[2]"/>, <xsl:value-of select="//tei:person[@xml:id='VB']/tei:birth/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte:  <xsl:value-of select="//tei:person[@xml:id='VB']/tei:death/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:value-of select="//tei:person[@xml:id='VB']/tei:death/tei:placeName/tei:settlement"/>, in provincia di <xsl:value-of select="//tei:person[@xml:id='VB']/tei:death/tei:placeName/tei:settlement[2]"/>, <xsl:value-of select="//tei:person[@xml:id='VB']/tei:death/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LKF']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        Nome: <xsl:value-of select="//tei:person[@xml:id='LKF']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='LKF']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='LKF']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='LKF']/tei:birth/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='LKF']/tei:birth/tei:placeName/tei:settlement"/>, <xsl:value-of select="//tei:person[@xml:id='LKF']/tei:birth/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template> 
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        Nome: <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:persName/tei:forename[1]"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        SecondoNome: <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:persName/tei:forename[2]"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:placeName/tei:settlement"/>, in provincia di <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:placeName/tei:settlement[2]"/>, <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>  
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='DS']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        Nome: <xsl:value-of select="//tei:person[@xml:id='DS']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='DS']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='DS']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='DS']/tei:birth/tei:date/@type"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='DS']/tei:birth/tei:placeName/@type"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template> 
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GS']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text> 
        Nome: <xsl:value-of select="//tei:person[@xml:id='GS']/tei:persName/tei:forename[1]"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='GS']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='GS']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:placeName/tei:settlement"/>, in provincia di <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:placeName/tei:settlement[2]"/>, <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:placeName/tei:country"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        Nome: <xsl:value-of select="//tei:person[@xml:id='LC']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='LC']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='LC']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='LC']/tei:birth/tei:date/@type"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='LC']/tei:birth/tei:placeName/@type"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        Nome: <xsl:value-of select="//tei:person[@xml:id='CN']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='CN']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='CN']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='CN']/tei:birth/tei:date"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='CN']/tei:birth/tei:placeName[@type]"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AA']">
       <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        Nome: <xsl:value-of select="//tei:person[@xml:id='AA']/tei:persName/tei:forename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:value-of select="//tei:person[@xml:id='AA']/tei:persName/tei:surname"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        Sesso:<xsl:value-of select="//tei:person[@xml:id='AA']/tei:sex"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita:  <xsl:value-of select="//tei:person[@xml:id='AA']/tei:birth/tei:date/@type"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:value-of select="//tei:person[@xml:id='AA']/tei:birth/tei:placeName/@type"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>      
    <!--LUOGHI-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']">
        <xsl:variable name="ref1">
            <xsl:value-of select="tei:placeName/@ref" />
        </xsl:variable>
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
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Paris']">
        <xsl:variable name="ref1">
            <xsl:value-of select="tei:placeName/@ref" />
        </xsl:variable>
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
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']">
        <xsl:variable name="ref1">
            <xsl:value-of select="tei:placeName/@ref" />
        </xsl:variable>
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
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='TOR']">
        <xsl:variable name="ref1">
            <xsl:value-of select="tei:placeName/@ref" />
        </xsl:variable>
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
    </xsl:template>
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']">
        <xsl:variable name="ref1">
            <xsl:value-of select="tei:placeName/@ref" />
        </xsl:variable>
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
        <xsl:text disable-output-escaping="yes"><![CDATA[<i>]]></xsl:text>
        <xsl:value-of select="tei:note/tei:p"/>
        <xsl:text disable-output-escaping="yes"><![CDATA[</i>]]></xsl:text>
    
    </xsl:template>

    
</xsl:stylesheet>
