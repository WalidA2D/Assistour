INSERT INTO TRANSPORTEUR VALUES(1, "BATY TAXI"),(2,"SNCF");

INSERT INTO DATE VALUES("2022/05/20"),("2022/05/22"),("2022/05/23");

INSERT INTO ADHERANT VALUES(1,"IVANOVICTH", "Sacha", "14 du boulevard du Temple", 75003, "Paris 3eme", 0692882953),(2,"BELKACEM", "Marwan", "2 de la rue Maspero", 75016, "Paris 16eme", 0673939905);

INSERT INTO GARAGE(IDGAR,NOM,ADRESSE,FORFAIT, TEL,AVANCEACCEPTE) VALUES(1, "Garage De La Sansonnais", "rue du Général De Gaulle, 22100 LANVALLAY", 210 ,0296854098, false), (2,"Citroen de Guéret", "22 rue du Marechal Leclerc , 23000, GUERET",190 ,0555524852, false);

INSERT INTO TECHNICIENASSISTANCE VALUES(1,"BENTOU", "Olivia");

INSERT INTO HOTEL VALUES(1,"L'hotel du théatre", "2 rue Sainte Claire - Dinan", 0296390691, 65 ), (2, "L'hotel Océan", "9 place du 11 novembre 1918 - Dinan", 0296854361, 79);

INSERT INTO TYPETRANSPORT VALUES(1, "Taxi"), (2, "Train TER"), (3, "Intercités");

INSERT INTO TYPECONTRAT VALUES(1, "Plénitude"), (2, "Tous Risques ECO");

INSERT INTO CONTRAT VALUES(1, 1,1,82, "3412CV75", "Citroen", "Voiture", "C3", "2003/04/15"), (2,1,1,90, "BJ83AE", "Renault" ,"Voiture", "Kadjar", "2019/10/10"), (3,2,2 ,75, "GN-92-DE", "Renault", "Voiture", "Koleos", "2020/01/03");

INSERT INTO DOSSIERSINISTRE VALUES(1,1,1,1,"2022/05/20", "13H27", "S'endort au volant", "Déformation modérée des éléments de direction", "Dinan", 1), (2,1,3,2, "2022/06/03", "19H30", "Percuter par un poids lourd", "Irrécupérable", "Saint Vaury", 2);

INSERT INTO ETAPE VALUES(2,1,1,1,"Saint Vaury", "Guéret", 22.00), (2,2,2,2, "Guéret", "Limoges", 23.80), (2,3,3,2, "Limoges", "Paris-Austerlitz", 68.00);

INSERT INTO HEBERGER VALUES("2022/05/20", 1, 1, 2), ("2022/05/22", 2, 1, 1), ("2022/05/23", 1, 1, 2);

INSERT INTO PROPOSER VALUES(1,1),(2,2),(3,2);
