({
    exec : function(c) {
        // Apex
        const action = c.get('c.registerOnThinka');
        action.setParams({
            recordId: c.get('v.recordId'),
        });
        // Callback
        action.setCallback(this, function(res) {
            const state = res.getState();
            const toastEvent = $A.get("e.force:showToast");

            // Window Close
            $A.get("e.force:closeQuickAction").fire();

            // Success ->
            if (state === 'SUCCESS') {
                toastEvent.setParams({
                    title : 'Success!!',
                    message:'Cancel processing completed.',
                    messageTemplate: '',
                    duration:' 5000',
                    key: 'info_alt',
                    type: 'success',
                    mode: 'pester'
                });
            }
            // Error ->
            else {
                toastEvent.setParams({
                    title : 'Error!!',
                    message:'Cancel processing failed.',
                    messageTemplate: '',
                    duration:' 5000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                });
            }
            toastEvent.fire();
        })
        $A.enqueueAction(action);
    }
})
