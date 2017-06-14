// AddGroupButton (JS Prompt Box, XMLHttpRequest)
//	Diese Methode fügt, unter Angabe von Gruppennamen und Beschreibung, eine neue Gruppe in den aktuellen Kurs hinzu.

function AddGroupButton() {
	var groupID = "";
	var groupname = window.prompt ("Bitte geben Sie den Gruppennamen ein:","");
	if (groupname == null || groupname == ""){
		alert ("Sie haben keinen Gruppennamen eingegeben! Der Vorgang wurde abgebrochen.");
	} else {
		var groupdescription = window.prompt ("Bitte geben Sie eine Gruppenbeschreibung ein:","");
		if (groupdescription == null || groupdescription == ""){
			alert ("Sie haben keine Gruppenbeschreibung eingegeben! Der Vorgang wurde abgebrochen.");
		} else {
			// XMLHttpRequest
			var add = new XMLHttpRequest ();
			add.onreadystatechange = function (){
				if (this.readyState == 4 && this.status == 200){
					// -> Lade neue Gruppe in Datenbank
				}
			}
			add.open ("POST", /*"Server file location?gname=" + groupname + "&gdescr=" + groupdescription*/, true);
			add.send(string);
			alert ('Die Gruppe: "' + groupname + '" wurde erfolgreich erstellt.');
		}
	}
}


// DeleteGroupButton (JS Confirm Box, XMLHttpRequest)
// Diese Methode löscht eine Gruppe des aktuellen Kurses aus der Datenbank.

function DeleteGroupButton() {
	if (window.confirm("Wollen Sie diese Gruppe wirklich löschen?") == true) {
		// XMLHttpRequest
		var del = new XMLHttpRequest ();
		del.onreadystatechange = function (){
			if (this.readyState == 4 && this.status == 200){
				// -> lösche Datensatz der Gruppe aus Datenbank
			}
		};
		del.open("POST", /*"Server file location*/, true);
		del.send(string);
		
		alert ("Sie haben die Gruppe gelöscht!");
	}
}
