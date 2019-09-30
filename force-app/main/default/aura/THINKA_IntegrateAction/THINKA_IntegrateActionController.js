({
    exec : function(c, e, h) {
        var action = c.get('c.exec');
        action.setParams({
            recordId: c.get('v.recordId')
        });
        action.setCallback(this, function(result) {

        });
        $A.enqueueAction(action);
    }
})
