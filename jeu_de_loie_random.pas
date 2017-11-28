PROGRAM
	JEU_DE_LOIE_JET_ALEATOIRE;

USES
	crt;

CONST
	oie=63; //changer sa valeur permet de modifier la dernière case n'étant pas une case de l'oie.
	multiple_oie=9; //Permet de modifier le multiple correspondant aux cases doublant les déplacements.
	arrivee=66;	//Permet de changer la case finale, celle de l'arrivée
	mort=58; //Permet de modifier la case renvoyant au début du jeu.
	depart=0; //Défini la case de départ.

VAR
	place,de1,de2,reste:INTEGER;
	
BEGIN
	clrscr;
	place:=depart;	//initialisation des variables
	de1:=0;
	de2:=0;		//fin

	writeln('Bienvenue dans le jeu de l oie');
	REPEAT
		
		randomize;
		de1:=random(6)+1;		//La fonction random(6) comprend toutes les valeurs de 0 à 6. On ajoute +1 pour ne pas obtenir un jet équivalent à 0.
		writeln('Lancez votre de en appuyant sur une touche');
		readkey;				//Oblige l'utilisateur à intervenir pour que le programme ne s'effectue pas seul. Simule le lancé du dé.
		writeln('Vous obtenez un ',de1);

		randomize;
		de2:=random(6)+1;		//La fonction random(6) comprend toutes les valeurs de 0 à 6. On ajoute +1 pour ne pas obtenir un jet équivalent à 0.
		writeln('Lancez votre second de en appuyant sur une touche');
		readkey;				//Oblige l'utilisateur à intervenir pour que le programme ne s'effectue pas seul. Simule le lancé du dé.
		writeln('Vous obtenez un ',de2);

		place:=place+de1+de2;

		REPEAT	//Boucle répéter permettant au joueur d'activer la case de l'oie plusieurs fois si il tombe à plusieurs reprises dessus en un jet.
		IF (place MOD multiple_oie=0) AND NOT (place>=oie) THEN		//Rupture SI permettant de déterminer si le joueur est oui ou non tombé sur une case de l'oie.
		begin
			writeln('Vous etes tombe sur la case ',place,'  qui est une case de l oie, vous avancez a nouveau du meme nombre de case !');
			place:=place+de1+de2;
		end;
		UNTIL (place MOD multiple_oie<>0) OR (place>=oie);

		IF (place>arrivee) THEN	//Rupture SI permettant de déterminer si le joueur a dépassé la case d'arrivée et doit donc retourner en arrière.
		begin
		reste:=place-arrivee; //la variable "reste" est la différence entre la position où est arrivé le joueur et le maximum du plateau. Il correspond au reste de cases que le joueur doit parcourir en arrière.
		writeln('Vous avez depasse la case 66 et revenez donc en arriere de ',reste,' cases');
		place:=arrivee-reste;
		end;

		writeln('Vous etes actuellement a la case : ',place);

		IF (place=mort) THEN //rupture SI permettant de déterminer si le joueur est tmombé sur la case "mort" le faisant revenir au départ.
		begin
			place:=depart;
			writeln('Vous etes tombe sur la case "mort" et retournez par consequent a la case 0 !');
		end;

	UNTIL (place=arrivee); //Condition de sortie
	writeln('Vous avez atteint l arrivee, vous avez gagne !');
	readkey;

END.