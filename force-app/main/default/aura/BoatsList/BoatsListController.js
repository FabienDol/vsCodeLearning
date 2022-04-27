({
    doInit : function(component, event, helper) {

        // récup l'action de BoatsList.cmp
        const action = component.get('c.getAllBoats');

        // set le callback (toujours la ref this en 1er parametre, et une fonction de callback en 2e apram)
        action.setCallback(this, function(response) {

            const state = response.getState();

            console.log(state);

            if(state === "SUCCESS") {
                // récup la valeur retournée
                const boats = response.getReturnValue();

                // faire passer la valeur retournée au front
                component.set("v.boats", boats);

                console.log(JSON.parse(boats, null, 2));

            } else {
                // gestion d'erreur
                console.log(state);
            }

        });

        // transmet l'action au serveur apex
        $A.enqueueAction(action);

        console.log("init called");

    }
})
