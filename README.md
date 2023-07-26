# Linear-Regression
Un proiect in OCTAVE care realizeaza o regresie liniara, utilizand un set de date parsat printr-un fisier .csv. 
Primul pas, dupa parsarea datelor descrisa in comentariile din cod, este codificarea matricei celula de predictori intr-o matrice numerica. Pentru yes/no => 1/0, iar pentru starea de mobilare
a fiecarui apartament folosim o codificare pe 2 biti. Astfel, vom avea nevoie, pe alocuri, de o coloana in plus concatenata orizontal. 

Pentru realizarea regresiei liniare, vom avea nevoie si de o functie de cost, care sa calculeze eroarea dintre predictia facuta de ecuatia h_theta descrisa in enunt si valorile efective ale modelului
liniar. Formula folosita va masura diferența pătrată medie între valorile prezise și valorile reale.

Pentru a imbunatatii generalizarea, adaugam un termen de penalizare în functia de cost care este proportional cu suma valorilor absolute ale parametrilor modelului. Acest lucru încurajează 
modelul să reduca magnitudinea caracteristicilor mai puțin importante, prin apropierea valorilor lor de zero. În regularizarea Lasso, termenul de penalizare este calculat ca produsul dintre 
parametrul de regularizare (lambda) și suma valorilor absolute ale parametrilor modelului:

termen_penalizare = lambda * sum(abs(parametri))

Regularizarea Ridge încurajeaza modelul sa distribuie ponderile caracteristicilor în mod echilibrat, in loc să acorde o importanta mare unor cateva caracteristici specifice. 
Aceasta ajuta la reducerea impactului colinearitatii și la imbunatatirea stabilitatii generale a modelului.
In regularizarea Ridge, termenul de penalizare este calculat ca produsul dintre parametrul de regularizare (lambda) si suma valorilor la patrat ale parametrilor modelului:

termen_penalizare = lambda * sum(parametri.^2)

Pentru calculul coeficientilor Theta, am folosit metoda gradientului descendent. Pasii sunt urmatorii:
    Calculeaza valorile prezise (H) folosind valorile curente ale parametrilor (Theta) si matricea de caracteristici (FeatureMatrix).
    Calculeaza eroarea prin scaderea valorilor reale de iesire (Y) din valorile prezise (H).
    Calculeaza gradientul inmultind transpusa matricei de caracteristici (FeatureMatrix') cu vectorul de eroare.
    Actualizeaza parametrii (Theta) prin scaderea produsului dintre rata de invatare (alpha) si gradient din valorile curente ale parametrilor.
    Repeta pasii anteriori pentru numarul specificat de iteratii (iter).
    
Daca matricea este pozitiv definita, verificata utilizand valorile proprii + proprietatea simetriei, putem aplica metoda gradientului conjugat prin Normal Equation,
fara a fi nevoie de tehnici de optimizare iterative, precum gradientul conjugat.
