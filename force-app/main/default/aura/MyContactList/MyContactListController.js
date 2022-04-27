({
    myAction : function(component, event, helper) {

        // création de l'action
        var action = component.get("c.getContacts");

        // set parametre de l'action
        action.setParams({
            recordId: component.get("v.recordId")
        });

        // définit un callback
        action.setCallback(this, function(data) {
            component.set("v.Contacts", data.getReturnValue());
        });

        // transmet l'action au serveur apex
        $A.enqueueAction(action);


        component.set("v.Columns", [
            {label:"First Name", fieldName:"FirstName", type:"text"},
            {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Phone", fieldName:"Phone", type:"phone"}
        ]);

    }
    
})
