CREATE OR REPLACE FUNCTION update_order_and_tickets_to_storno_ws(order_id bigint)
RETURNS jsonb SECURITY DEFINER AS $$
DECLARE
    occasion_id bigint;
BEGIN
    -- Retrieve the occasion associated with the order
    SELECT occasion INTO occasion_id FROM eshop.orders WHERE id = order_id;

    -- Check if the order exists and has an associated occasion
    IF occasion_id IS NULL THEN
        RAISE EXCEPTION 'Order not found or no associated occasion.';
    END IF;

    -- Verify if the user is an editor on the occasion
    IF (SELECT get_is_editor_order_on_occasion(occasion_id)) <> TRUE THEN
        RAISE EXCEPTION 'User is not editor.';
    END IF;

    -- Call the original function to update the order and tickets
    RETURN update_order_and_tickets_to_storno(order_id);
EXCEPTION WHEN OTHERS THEN
    -- Handle any exceptions
    RETURN jsonb_build_object(
        'code', 500,
        'message', SQLERRM,
        'detail', coalesce(SQLERRM, 'An unexpected error occurred')
    );
END;
$$ LANGUAGE plpgsql;