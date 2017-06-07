
<!-- Autor: Eric Adam, Erstelldatum: 19.05.2017 -->

<!--
	-- Dokumentation zur Datei "Einzelseiten.jsp" --
		
		Pfad im Portal: Login -> Startseite (Dozentensicht) -> konkreter Kurs auswählen -> Kursseite
		
		In dieser JSP-File wurde das "Einzelnoten" Fenster implementiert, welche der Dozent sieht, wenn er auf 
		einer Kursseite den Einzelnoten-Button einer konkreten Gruppe auswählt.
		Das "Einzelnoten" Fenster einer Gruppe zeigt alle Gruppenmitglieder in Form einer Tabelle an. 
		
		Hierzu wurden die Technologien HTML, CSS, JavaScript und AJAX verwendet.
		Das Design ist ganzheitlich durch Bootstrap und grundsätzlichen HTML-Elementen gegeben.
		Bootstrap verwendet hierzu Komponenten von JQuery.
		
		Implementiert wurde eine Tabelle mit den Spalten: Name, alle Kriterien, Gesamtnote, Korrekturnote und Notizbox.
		
		Die Zellen einer Zeile und Person ergeben sich jeweils pro Kriterium aus dem Bewertungs-Algorithmus.
		
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
		<title>Einzelnoten</title>
		
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
			<!-- HEADER -->
			<div class="row">
				<div class="col-lg-1">
					<img id="logo" alt="HSKA IWI" src="https://ilias.hs-karlsruhe.de/Customizing/global/skin/hska/images/HeaderIcon.svg">
				</div>
				<div class="col-lg-9">
					<div class="page-header">
						<h1>
							<!-- Seiten-Ãœberschrift -->
							TeamRating - Portal
							<div>
								<img alt="HSKA icon" src="https://www.iwi.hs-karlsruhe.de/intranet/images/hska-wii_rot/iwi_ci_logo25.png?usn=263662077">
							</div>
						</h1>
					</div>
				</div>
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
					<!-- Bild (Ersetzen durch Männchen)-->
					<span class="label label-default" style="font-size: 16px;">ader1012</span> 
					<button type="button" class="btn btn-default" onclick="Logout()">Abmelden</button>
				</div>
			</div>
			
			<!-- Kursseite -->
			<div>
				<!-- Pfadanzeige (Bootstrap Breadcrumbs)-->
				<ol class="breadcrumb">
					<li><a href="Navigationsseite.html">Meine Kurse</a></li>
					<li><a href="Kursseite_Dozent.html">AWP</a></li>
					<li class="active">Einzelnoten</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-lg-5">
					<h2>Gruppe 1: <b>HSKA TeamRating-Portal</b></h2>
					<h3>Einzelnoten</h3>
					<p>
						<em>Hier sind die Einzelnoten pro Kriterium für diese Gruppe.
							<br><br>
							Jede Einzelnote einer Person wurde hierbei pro Kriterium unter Berücksichtigung der Gruppennote und der Bewertung von den restlichen Teammitgliedern mit dem implementierten Algorithmus berechnet.
							<br><br>
							Die Gesamtnote ergibt sich aus der summierten Gewichtung der Einzelnoten.
							<br><br>
						</em>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2">
					<h4><strong>Gruppennote: 2.0</strong><br></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<!--Tabelle mit Gruppen-->
						<table class="table">
							<thead>
								<tr>
									<th>Name</th>
									<th style="text-align: center;">Qualität</th>
									<th style="text-align: center;">Teamfähigkeit</th>
									<th style="text-align: center;">Kommunikation</th>
									<th style="text-align: center;">Technische Kompetenz</th>
									<th style="text-align: center;">Fachliche Kompetenz</th>
									<th style="text-align: center;">Engagement</th>
									<th style="text-align: center;">Gesamtnote</th>
									<th style="text-align: center;">Korrektur?</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<!-- Einzelperson: KorrekturButton (JS Prompt Box) FÄLLT WEG -> Ersatz durch Textbox und In Place
								<div>
									<script>
										function KorrekturButton() {
											if (window.confirm("Möchten Sie diese Note wirklich ändern?") == true){
												var newGrade = window.prompt ("Bitte geben Sie die korrigierte Note ein:","");
												if (newGrade == null || newGrade == ""){
													alert ("Sie haben keine Note eingegeben! Der Vorgang wurde abgebrochen.");
												} else {
													// TODO Datenbank-Zugriff: Schreiben in DB
													alert ("Die Note wurde erfolgreich zu " + newGrade + " abgeändert.");
												}
											}
										}
									</script>
								</div> -->
								
								<!-- Einzelperson: Notizbox-SaveButton -->
								<!-- div>
									<script>
										function SaveButton (){
											// TODO Datenbank-Zugriff: Speichern der Notiz
										}
									</script>
								</div -->
								
								<!-- Datensätze -->
								<!-- TODO Datenbank-Zugriff: Autoread der Datensätze -->
								<!-- Beispiel Datensatz 1 -->
								<tr>
									<td style="vertical-align: middle;">Michael Kurz</td>
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>3.0</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.3</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>2.0</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- Beispiel Datensatz 2 -->
								<tr>
									<td style="vertical-align: middle;">Mohamed Lezzar</td>
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.3</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>1.7</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- Beispiel Datensatz 3 -->
								<tr>
									<td style="vertical-align: middle;">Helene Hirsch</td>
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.0</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.0</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>1.3</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- Beispiel Datensatz 4 -->
								<tr>
									<td style="vertical-align: middle;">Maurice Eschelbach</td>
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>1.7</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- Beispiel Datensatz 5 -->
								<tr>
									<td style="vertical-align: middle;">Thomas Miller</td>
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>1.7</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- Beispiel Datensatz 6 -->
								<tr>
									<td style="vertical-align: middle;">Franziska Widmaier</td>
									<td style="text-align: center; vertical-align: middle;"><strong>2.3</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.3</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.0</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>2.0</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- Beispiel Datensatz 7 -->
								<tr>
									<td style="vertical-align: middle;">Adela Mohr</td>
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Qualität-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.3</strong></td> <!--Teamfähigkeit-->
									<td style="text-align: center; vertical-align: middle;"><strong>3.0</strong></td> <!--Kommunikation-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.3</strong></td> <!--Technische Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>1.7</strong></td> <!--Fachliche Kompetenz-->
									<td style="text-align: center; vertical-align: middle;"><strong>2.3</strong></td> <!--Engagement-->
									<td style="text-align: center; font-size: 20px; vertical-align: middle;"><strong>2.0</strong></td> <!--Gesamtnote-->
									<td style="text-align: center; vertical-align: middle;"><a href="#" class="btn btn-warning" onclick="KorrekturButton()"><span class="glyphicon glyphicon-edit"></span></a></td>
									<td>
										<div class="col-lg-100">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="Notiz">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" onclick="SaveButton()">Save</button>
												</span>
											</div>
										</div>
									</td>
								</tr>
								<!-- weitere Datensätze -->
								<!-- ... -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- row -->
	</div> <!-- container fluid -->
	</body>
</html>