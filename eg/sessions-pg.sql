-- $Id$
-- You should install plpgsql.
-- /usr/local/pgsql/bin/createlang -U postgres plpgsql <YourDB>

-- DROP TABLE sessions;
CREATE TABLE sessions (
       ID CHAR(32) NOT NULL PRIMARY KEY,
       a_session TEXT,
       last_access TIMESTAMP
);

-- DROP FUNCTION update_time();
CREATE FUNCTION update_time() returns opaque as '
BEGIN
	NEW.last_access := CURRENT_TIMESTAMP;
	RETURN NEW;  	
END;
' language 'plpgsql';

-- DROP TRIGGER sessions_timestamp ON sessions;
CREATE TRIGGER sessions_timestamp 
BEFORE INSERT OR UPDATE ON sessions
FOR EACH ROW EXECUTE PROCEDURE update_time();
