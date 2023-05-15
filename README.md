# Tema2_PDS
PROIECTAREA FILTRELOR CU RĂSPUNS FINIT LA IMPULS / PROIECTAREA FILTRELOR CU RĂSPUNS INFINIT LA IMPULS

TEMA 2
I. PROIECTAREA FILTRELOR CU RĂSPUNS FINIT LA IMPULS
Proiectați în Matlab un filtru digital RFI cu parametrii specificați în tabelul TABEL-RFI de mai jos.
Determinați (dacă nu este dat) ordinul filtrului folosind funcția firpmord.
a) Proiectați filtrul folosind pentru proiectare funcțiile fir1 sau fir2 și alegeți fereastra optimă care
permite realizarea atenuării minime cerute pentru banda de oprire.
• Reprezentați grafic coeficienții filtrului h(n).
• Reprezentați grafic zerourile filtrului.
• Reprezentați grafic caracteristica amplitudine-pulsație normată și caracteristica fazăpulsație normată.
• Reprezentați grafic caracteristica amplitudine [dB] - frecvență [Hz] a filtrului digital
proiectat și verificați cu ajutorul zoom-ului și a cursorilor condițiile de proiectare
impuse (limitele benzilor de trecere și oprire, atenuări).
b) Proiectați filtrul folosind metoda de proiectare prin minimizarea erorii indicată în tabel
(funcțiile firls sau firpm).
• Reprezentați grafic coeficienții filtrului h(n).
• Reprezentați grafic zerourile filtrului.
• Reprezentați grafic caracteristica amplitudine-pulsație normată și caracteristica fazăpulsație normată.
• Reprezentați grafic caracteristica amplitudine [dB] - frecvență [Hz] a filtrului digital
proiectat și verificați cu ajutorul zoom-ului și a cursorilor condițiile de proiectare
impuse (limitele benzilor de trecere și oprire, atenuări).
II. PROIECTAREA FILTRELOR CU RĂSPUNS INFINIT LA IMPULS
a) Proiectați în Matlab un filtru digital RII cu parametrii specificați în tabelul TABEL-RII de mai
jos, folosind metoda indirectă de proiectare indicată în tabel.
• Determinați (dacă este cazul) ordinul și frecvența de tăiere ale filtrului analogic.
• Determinați coeficienții funcției filtrului analogic
H (s)
a
și ai filtrului digital
H (z) .
• Reprezentați grafic răspunsul în frecvență și poziția polilor și a zerourilor pentru filtrul
analogic.
• Reprezentați grafic răspunsul în frecvență și poziția polilor și a zerourilor pentru filtrul
digital proiectat.
• Reprezentați grafic caracteristica amplitudine [dB] - frecvență [Hz] a filtrului digital
proiectat și determinați cu ajutorul zoom-ului și a cursorilor câștigul filtrului la
frecvențele de tăiere din tabel verificând condițiile de gabarit impuse.
b) Reluați proiectarea filtrului digital de la punctul a) folosind metoda directă de proiectare a
filtrelor RII din Matlab.
• Reprezentați grafic răspunsul în frecvență și poziția polilor și a zerourilor pentru filtrul
digital proiectat.
• Reprezentați grafic caracteristica amplitudine [dB] - frecvență [Hz] a filtrului digital
proiectat și determinați cu ajutorul zoom-ului și a cursorilor câștigul filtrului la
frecvențele de tăiere din tabel verificând condițiile de gabarit impuse.
c) Aplicați la intrarea filtrului proiectat la punctul b) (cu metoda directă) un semnal sinusoidal de
frecvență variabilă între 0 Hz si FS/2 generat cu ajutorul funcției Matlab chirp. Durata
semnalului generat este de 1 secundă.
• Reprezentați semnalele de la intrarea și ieșirea filtrului.
• Reprezentați spectrograma semnalelor de la intrarea și ieșirea filtrului.
