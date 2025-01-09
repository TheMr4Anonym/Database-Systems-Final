SELECT 
    e.continent,
    ROUND(CAST(COVAR_POP(a.renewables_share_elec, em.carbon_intensity_elec) AS NUMERIC), 2) AS covariance
FROM allrenewables a
JOIN emissions em ON a.code = em.code AND a.year = em.year
JOIN encompasses e ON a.code = e.country
WHERE a.year BETWEEN 2010 AND 2022
GROUP BY e.continent;

/*Was ist Kovarianz (Covariance)?
Die Kovarianz misst die Richtung und Stärke einer linearen Beziehung zwischen zwei Variablen. Für deine Query bedeutet das:

Variable 1: Der Anteil erneuerbarer Energien am Stromverbrauch (renewables_share_elec).
Variable 2: Die Kohlenstoffintensität des Stromverbrauchs (carbon_intensity_elec).
Die Kovarianz zeigt uns, wie sich diese beiden Variablen gemeinsam verhalten:

Eine positive Kovarianz bedeutet, dass beide Variablen tendenziell gemeinsam steigen oder fallen.
Eine negative Kovarianz bedeutet, dass eine Variable steigt, während die andere tendenziell sinkt.
Eine Kovarianz nahe Null deutet darauf hin, dass es keine systematische Beziehung zwischen den beiden Variablen gibt.
Berechnung der Kovarianz in SQL
In deiner Query wird die Funktion COVAR_POP verwendet, die die Populations-Kovarianz berechnet. Das bedeutet, dass die Kovarianz über alle Datenpunkte berechnet wird (keine Stichprobenkorrektur).

Die Formel für die Kovarianz lautet:

Cov(X, Y)
=
1
𝑁
∑
𝑖
=
1
𝑁
(
𝑋
𝑖
−
𝑋
‾
)
(
𝑌
𝑖
−
𝑌
‾
)
Cov(X, Y)= 
N
1
​
  
i=1
∑
N
​
 (X 
i
​
 − 
X
 )(Y 
i
​
 − 
Y
 )
Wo:

𝑋
𝑖
X 
i
​
 : Der Wert der ersten Variable (z. B. renewables_share_elec) für einen bestimmten Datenpunkt.
𝑌
𝑖
Y 
i
​
 : Der Wert der zweiten Variable (z. B. carbon_intensity_elec) für denselben Datenpunkt.
𝑋
‾
X
 : Der Mittelwert der ersten Variable.
𝑌
‾
Y
 : Der Mittelwert der zweiten Variable.
𝑁
N: Die Anzahl der Datenpunkte.
Interpretation der Kovarianz in deiner Query
In deiner Query:

sql
Code kopieren
ROUND(CAST(COVAR_POP(a.renewables_share_elec, em.carbon_intensity_elec) AS NUMERIC), 2)
COVAR_POP: Berechnet die Populations-Kovarianz zwischen den beiden Variablen für jede Gruppe von Ländern auf einem Kontinent (weil wir mit GROUP BY e.continent arbeiten).
CAST(... AS NUMERIC): Konvertiert das Ergebnis der Kovarianz in einen NUMERIC-Typ, damit es gerundet werden kann.
ROUND(..., 2): Rundet die Kovarianz auf zwei Dezimalstellen.
Anwendungsbeispiel
Wenn die Kovarianz positiv ist, könnte das bedeuten, dass Länder mit einem höheren Anteil erneuerbarer Energien oft auch eine höhere Kohlenstoffintensität aufweisen (z. B., weil erneuerbare Energien nicht ausreichend genutzt werden, um fossile Energien zu ersetzen).
Eine negative Kovarianz würde darauf hindeuten, dass ein höherer Anteil erneuerbarer Energien mit einer niedrigeren Kohlenstoffintensität verbunden ist.
Limitierungen und Überlegungen
Die Kovarianz allein gibt keine genaue Stärke der Beziehung an. Für eine normalisierte Maßzahl wäre die Korrelation (z. B. mit CORR) besser geeignet.
Große Kovarianzwerte könnten durch extrem unterschiedliche Skalierungen der beiden Variablen beeinflusst werden. Es ist wichtig, die Daten zu verstehen, bevor man Schlussfolgerungen zieht.
Hast du spezifische Fragen zur Interpretation der Kovarianz für dein Beispiel?



auch bisschen heavy


*/ 