CREATE SEQUENCE part_number_seq START WITH 27812;

CREATE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION inc()
RETURNS "trigger" AS
$BODY$
BEGIN
NEW.msgId = nextval('part_number_seq');
RETURN NEW;
END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER message_trigger BEFORE INSERT
ON message FOR EACH ROW
EXECUTE PROCEDURE inc();