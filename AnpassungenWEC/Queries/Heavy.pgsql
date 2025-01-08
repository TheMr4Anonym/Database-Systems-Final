SELECT 
    e.continent,
    ROUND(CAST(CORR(a.renewables_share_elec, et.net_elec_imports) AS numeric), 2) AS correlation
FROM allrenewables a
JOIN energytrade et ON a.code = et.code AND a.year = et.year
JOIN encompasses e ON a.code = e.country
WHERE a.year BETWEEN 2010 AND 2022
GROUP BY e.continent;

/*  BISSCHEN HEAVY
1. Funktion CORR(x, y)
Die Funktion CORR berechnet den Pearson-Korrelationskoeffizienten zwischen zwei Variablen x und y.
Formel:
𝑟
=
Kovarianz
(
𝑥
,
𝑦
)
Standardabweichung
(
𝑥
)
⋅
Standardabweichung
(
𝑦
)
r= 
Standardabweichung(x)⋅Standardabweichung(y)
Kovarianz(x,y)
​
 
Kovarianz: Misst, wie zwei Variablen gemeinsam variieren.
Standardabweichung: Misst, wie stark die Werte um ihren Mittelwert streuen.
2. Daten in der Query
renewables_share_elec:
Der Anteil erneuerbarer Energien an der gesamten Stromerzeugung (in %).
Höhere Werte bedeuten, dass ein Land mehr Strom aus erneuerbaren Energien generiert.
net_elec_imports:
Die Netto-Stromimporte eines Landes.
Positive Werte bedeuten Importe, negative Werte Exporte (d.h. das Land exportiert Strom).
3. Bedeutung der Korrelation
Der Pearson-Korrelationskoeffizient 
𝑟
r liegt zwischen 
−
1
−1 und 
1
1:
𝑟
=
1
r=1: Perfekte positive Korrelation (wenn der Anteil erneuerbarer Energien steigt, steigen die Stromimporte).
𝑟
=
−
1
r=−1: Perfekte negative Korrelation (wenn der Anteil erneuerbarer Energien steigt, sinken die Stromimporte, d.h. mehr Exporte).
𝑟
=
0
r=0: Keine lineare Beziehung (die Variablen sind unabhängig).
4. Korrelation in der Query
Die Query berechnet die Korrelation pro Kontinent:

Gruppierung nach e.continent:
Für jeden Kontinent werden die Werte von renewables_share_elec und net_elec_imports der Länder herangezogen.
Vergleich der Variablen:
Wenn Länder mit einem hohen Anteil erneuerbarer Energien oft negative Nettoimporte (Exporte) haben, wird eine negative Korrelation berechnet.
Wenn Länder mit einem hohen Anteil erneuerbarer Energien oft positive Nettoimporte haben, wird eine positive Korrelation berechnet.
5. Interpretation
Die berechnete Korrelation zeigt, wie stark erneuerbare Energien die Stromhandelsbilanz eines Kontinents beeinflussen könnten:

Positive Korrelation:
Länder mit mehr erneuerbaren Energien importieren auch mehr Strom. Mögliche Gründe könnten sein:
Länder produzieren weniger Strom insgesamt, trotz erneuerbarer Energie.
Saisonale Schwankungen in erneuerbarer Energie (z. B. Wind- oder Solarenergie).
Negative Korrelation:
Länder mit mehr erneuerbaren Energien exportieren mehr Strom. Das zeigt:
Länder mit hohen Anteilen erneuerbarer Energien sind möglicherweise Energieüberschüsse erzeugende Länder.
Sie könnten unabhängig von Stromimporten sein und als Stromexporteure auftreten.
6. Beispiele
Europa: Eine negative Korrelation könnte bedeuten, dass Länder wie Deutschland und Schweden (mit hohen Anteilen erneuerbarer Energien) mehr Strom exportieren.
Afrika: Eine geringe oder positive Korrelation könnte darauf hinweisen, dass die Abhängigkeit von Stromimporten trotz erneuerbarer Energien besteht.
Die Korrelation liefert also Hinweise darauf, wie stark erneuerbare Energien die Handelsbilanz der Elektrizität in einer Region beeinflussen.
*/





