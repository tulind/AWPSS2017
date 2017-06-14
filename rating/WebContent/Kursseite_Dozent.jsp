
<!-- Autor: Eric Adam, Erstelldatum: 19.05.2017 -->

<!--
	-- Dokumentation zur Datei "Kursseite.jsp" --
		
		Pfad im Portal: Login -> Startseite (Dozentensicht) -> konkreter Kurs auswählen -> Kursseite
		
		In dieser JSP-File wurde die "Kursseite" implementiert, welche der Dozent sieht, wenn er auf 
		seiner Startseite einen konkreten, laufenden Kurs, z.B. eBusiness, auswählt.
		Die "Kursseite" eines Kurses zeigt alle Gruppen des gewählten Kurses in Form einer Tabelle an. 
		
		Hierzu wurden die Technologien HTML, CSS, JavaScript und AJAX verwendet.
		Das Design ist ganzheitlich durch Bootstrap und grundsätzlichen HTML-Elementen gegeben.
		Bootstrap verwendet hierzu Komponenten von JQuery.
		
		Implementiert wurde eine Tabelle mit den Spalten: Nr., Name, Beschreibung, Gruppennote, 
		Einzelnoten-Button (pro Zeile, bzw. Gruppe) sowie Löschen-Button (pro Zeile, bzw. Gruppe). 
		
		Der Einzelnoten-Button ist lediglich eine Verknüpfung zu den Einzelnoten der jeweiligen Gruppe.
		Der Löschen-Button realisiert die Möglichkeit des Löschens einer Gruppe, bzw. Zeile.
		
		Bei jeder GUI Komponente wurde jeweils direkt davor kommentiert, um welche Komponente es sich handelt
		und gegebenenfalls welche Technologie im Einzelnen verwendet wurde.
-->

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Dateiname, sowie Browser-Tab-Name -->
		<title>Kursseite</title>

		<meta name="author" content="Eric Adam">
		
		<!-- Logoformat -->
		<style>
			#logo{
				display: table-cell;
				text-align: center;
				vertical-align: middle;
				position: absolute;
				width: 120px;
				height: 120px;
				max-width: 100%;
			}
		</style>
		
		<!-- Einbindung von Komponenten zum Betrieb von Bootstrap 
			Damit das Design von Bootstrap in HTML implementiert und ausgeführt werden kann, müssen verschiedene
			Komponenten anderer Technologien eingebunden werden.

			Einbindung von CSS für Bootstrap 
			Die jeweiligen Komponenten sind im Ordner "CSS", im gleichen Verzeichnis wie diese Datei, abgelegt.
		-->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		
		<!-- Einbindung von JavaScript-Files zu Bootstrap und JQuery
			Die jeweiligen Komponenten sind im Ordner "JS", im gleichen Verzeichnis wie diese Datei, abgelegt.
		-->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
	</head>

	
	<!-- BODY -->
	<body>
	<div class="container-fluid">
	<br>
	<div class="row">
		<div class="col-lg-12">
			<!-- PAGE-HEADER -->
			<div class="row">
				<div class="col-lg-1">
					<img id="logo" alt="HSKA IWI" src="https://ilias.hs-karlsruhe.de/Customizing/global/skin/hska/images/HeaderIcon.svg">
				</div>
				<div class="col-lg-9">
					<div class="page-header">
						<h1>
							<!-- Seiten-Üœberschrift -->
							TeamRating - Portal
							<div>
								<img alt="HSKA icon" src="https://www.iwi.hs-karlsruhe.de/intranet/images/hska-wii_rot/iwi_ci_logo25.png?usn=263662077">
							</div>
						</h1>
					</div>
				</div>
				<!-- Bild (Ersetzen durch Männchen)-->
				<div class="col-lg-1">
					<img alt="Bootstrap Image Preview" src="http://lorempixel.com/140/140/" width="100px" height="100px">
				</div>
				<!-- Abmelden Button -->
				<div class="col-lg-1">
					<script>
						function Logout(){
							if (window.confirm ("Wollen Sie sich wirklich abmelden?") == true){
								// TODO Logout durchführen
							}
						}
					</script>
					<!-- IZ-Kürzel Benutzerlabel -->
					<span class="label label-default" style="font-size: 16px;">ader1012</span> 
					<button type="button" class="btn btn-default" onclick="Logout()">Abmelden</button>
				</div>
			</div>
			
			<!-- KURSSEITE -->
			<div>
				<!-- Pfadanzeige (Bootstrap Breadcrumbs)-->
				<ol class="breadcrumb">
					<li><a href="Navigationsseite.html">Meine Kurse</a></li>
					<li class="active">AWP</li>
				</ol>
			</div>
			<!-- MassenGruppenerstellung Dropdown Button -->
			<!--div class="row">
				<div class="col-lg-9"></div>
				<div class="col-lg-1">
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" 
								aria-expanded="false">Masse <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">5 Gruppen</a></li>
							<li><a href="#">10 Gruppen</a></li>
							<li><a href="#">20 Gruppen</a></li>
							<li><a href="#">25 Gruppen</a></li>
							<li><a href="#">30 Gruppen</a></li>	
							<li><a href="#">35 Gruppen</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div-->
			<!-- Kurstabelle -->
			<div class="row">
				<div class="col-lg-10">
					<h2>Kurs: <strong>AWP</strong></h2>
					<h3>Gruppen</h3>
					<p><em>Hier sind die aktuellen Gruppen des gewählten Kurses.</em></p>
						
					<!-- responsive Tabelle -->
					<div class="table-responsive">
						<!--Tabelle mit Gruppen-->
						<table class="table">
							<thead>
								<tr>
									<th>Nr.</th>
									<th>Name</th>
									<th>Beschreibung</th>
									<th>Gruppennote</th>
									<th>Einzelnoten</th>
									<th>Löschen?</th>
								</tr>
							</thead>
							<tbody>
								<!-- EinzelnotenButton (JS Redirect)-->
								<!-- script>
									function EinzelnotenButton() {
										window.location = "file:///C:/Users/Eric/Desktop/Kursfenster_Eric/Einzelnoten.html";
										// TODO Datenbank-Zugriff: konkrete Gruppe übergeben
									}
								</script -->
								
								<!-- Datensätze -->
								<!-- TODO Datenbank-Zugriff: Autoread der Datensätze -->
								<!-- Beispiel Datensatz 1 -->
								<tr>
									<td>1</td>
									<td>HSKA TeamRating-Portal</td>
									<td><p>Wir implementieren ein Online-Portal, welches eine transparente und faire Benotung innerhalb von Gruppenarbeiten ermöglicht.</p></td>
									<td style="text-align: center; vertical-align: text-top; font-size: 16px"><strong>2.0</strong></td>
									<td style="text-align: center; vertical-align: text-top;"><a href="Einzelnoten.jsp" class="btn btn-primary" onclick="EinzelnotenButton()"><span class="glyphicon glyphicon-share"></span></a></td>
									<td style="text-align: center; vertical-align: text-top;"><a href="#" class="btn btn-danger" onclick="DeleteGroupButton()"><span class="glyphicon glyphicon-remove"></span></a></td>
								</tr>
								<!-- Beispiel Datensatz 2 -->
								<tr>
									<td>2</td>
									<td>SmartMirror</td>
									<td><p>Wir implementieren einen smarten Spiegel, welcher Wetterberichte, To-Do's, Erinnerungen und News anzeigt.</p></td>
									<td style="text-align: center; vertical-align: text-top; font-size: 16px"><strong>1.7</strong></td>
									<td style="text-align: center; vertical-align: text-top;"><a href="Einzelnoten.jsp" class="btn btn-primary" onclick="EinzelnotenButton()"><span class="glyphicon glyphicon-share"></span></a></td>
									<td style="text-align: center; vertical-align: text-top;"><a href="#" class="btn btn-danger" onclick="DeleteGroupButton()"><span class="glyphicon glyphicon-remove"></span></a></td>
								</tr>
								<!-- weitere Datensätze -->
								
							</tbody>
						</table>
					</div>
					<div>
						<a href="#" class="btn btn-success" onclick="AddGroupButton()"><span class="glyphicon glyphicon-plus"></span> Hinzufügen</a>
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
	</div>
	</div>
	<!-- Kursseite_Dozent.js Einbindung -->
	<script src="js/Kursseite_Dozent.js"></script>
	</body>
</html>