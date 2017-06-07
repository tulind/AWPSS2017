// AddGroupButton (JS Prompt Box)
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
			alert ('Die Gruppe: "' + groupname + '" wurde erfolgreich erstellt.');
		}
	}
	// TODO Datenbank-Zugriff: Schreiben in DB
}


// DeleteGroupButton (JS Confirm Box)
function DeleteGroupButton() {
	if (window.confirm("Wollen Sie diese Gruppe wirklich löschen?") == true) {
		// TODO Datenbank-Zugriff: Gruppe löschen
		alert ("Sie haben die Gruppe gelöscht!");
	}
}
